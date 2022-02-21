//
//  DashboardController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import Rswift
import RxSwift
import RxRelay
import RxDataSources
import UIKit

final class DashboardViewController: BaseViewController, DashboardViewInput, DashboardViewOutput {

    // MARK: - LoaderViewInput
    
    var viewModel: DashboardViewModel!

    // MARK: - LoaderViewOutput
    
    var selectedType: DrinksType = .all
    
    // MARK: - Private properties
    
    var isItemSelected = BehaviorRelay<Bool>(value: false)

    // MARK: - Views
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .blackColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .blackColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        print("DashboardViewController")
    }

    // MARK: - Actions

    // MARK: - Private Methods

    private func setupUI() {
        setupConstraints()
        registerCells()
    }

    private func setupBindings() {
        let dataSource = self.dataSource()
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        viewModel.sections.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        self.isItemSelected.asObservable().subscribe { [weak self] event in
            guard let event = event.element else { return }
            if event {
                self?.tableView.reloadData()
            }
        }.disposed(by: self.disposeBag)
    }
    
    private func setupConstraints() {
        view.addSubview(mainView)
        mainView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func registerCells() {
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        tableView.register(DashboardContentCell.self, forCellReuseIdentifier: DashboardContentCell.identifier)
        tableView.register(SliderMenuCell.self, forCellReuseIdentifier: SliderMenuCell.identifier)
        
    }
    
}

extension DashboardViewController: UIScrollViewDelegate, UITableViewDelegate {
    
    private func dataSource() -> RxTableViewSectionedReloadDataSource<DashboardSectionModel> {
        return RxTableViewSectionedReloadDataSource<DashboardSectionModel>(
            configureCell: { [weak self] (_, tv, indexPath, sectionItem) in
                guard let self = self else { return UITableViewCell() }
                switch sectionItem {
                case .headerItem:
                    return self.prepareHeaderCell(tv, indexPath: indexPath)
                case .sliderMenuItem:
                    return self.prepareSliderMenuCell(tv, indexPath: indexPath)
                case .contentItem:
                    return self.prepareContentCell(tv, indexPath: indexPath)
                }
            }
        )
    }
    
    private func prepareHeaderCell(_ tv: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let headerCell = tv.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath)
                as? TitleTableViewCell else {
            fatalError("Cell is not of kind \(TitleTableViewCell.nameOfClass)")
        }
        
        return headerCell
    }
    
    private func prepareContentCell(_ tv: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let contentCell = tv.dequeueReusableCell(withIdentifier: DashboardContentCell.identifier, for: indexPath)
                as? DashboardContentCell else {
            fatalError("Cell is not of kind \(DashboardContentCell.nameOfClass)")
        }
        self.viewModel.isSelected.asObservable().subscribe({ [weak self, weak contentCell] drinkType in
            guard let drinkType = drinkType.element else { return }
            contentCell?.configure(type: drinkType)
        }).disposed(by: disposeBag)
        
        contentCell.isItemSelected.asObservable().subscribe { [weak self] isItemSelected in
            guard let isItemSelected = isItemSelected.element else { return }
            if isItemSelected {
                self?.isItemSelected.accept(isItemSelected)
            }
            
        }.disposed(by: disposeBag)
        
        return contentCell
    }
    
    private func prepareSliderMenuCell(_ tv: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let sliderCell = tv.dequeueReusableCell(withIdentifier: SliderMenuCell.identifier, for: indexPath)
                as? SliderMenuCell else {
            fatalError("Cell is not of kind \(SliderMenuCell.nameOfClass)")
        }
        
        sliderCell.onSelected = { [weak self] drinkType in
            self?.viewModel.isSelected.accept(drinkType)
        }
        
        return sliderCell
    }
    
}
