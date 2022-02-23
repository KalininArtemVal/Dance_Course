//
//  DashboardDetailController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 22.02.2022.
//

import Rswift
import RxSwift
import RxRelay
import RxDataSources
import UIKit

class DashboardDetailController: BaseViewController, DashboardDetailViewInput, DashboardDetailViewOutput {
    
    // MARK: - Input
    
    var viewModel: DashboardDetailViewModel!
    
    // MARK: - Output
    
    var onClose: Action?
    
    var onCard: Action?
    
    // MARK: - Private properties
    
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
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("Buy", for: .normal)
        button.titleLabel?.font = .priceFont
        button.setTitleColor(.whiteColor, for: .normal)
        button.backgroundColor = .orangeColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupBindings() {
        let dataSource = self.dataSource()
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        viewModel.sections.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func setupUI() {
        setupBindings()
        registrationCell()
        setupConstraints()
    }
    
    private func registrationCell() {
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.identifier)
        tableView.register(SizeCell.self, forCellReuseIdentifier: SizeCell.identifier)
    }
    
    private func setupConstraints() {
        view.addSubview(mainView)
        mainView.addSubview(tableView)
        mainView.addSubview(buyButton)
        
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
        
        NSLayoutConstraint.activate([
            buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buyButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            buyButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            buyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension DashboardDetailController: UIScrollViewDelegate, UITableViewDelegate {
    
    private func dataSource() -> RxTableViewSectionedReloadDataSource<DashboardDetailSectionModel> {
        return RxTableViewSectionedReloadDataSource<DashboardDetailSectionModel>(
            configureCell: { [weak self] (_, tv, indexPath, sectionItem) in
                guard let self = self else { return UITableViewCell() }
                switch sectionItem {
                case .headerItem(let cellVM):
                    return self.prepareHeaderCell(tv, indexPath: indexPath, cellViewModel: cellVM)
                case .descriptionItem(vm: let cellVM):
                    return self.prepareDescriptionCell(tv, indexPath: indexPath, cellViewModel: cellVM)
                case .sizeItem:
                    return self.prepareSizeCell(tv, indexPath: indexPath)
                }
            }
        )
    }
    
    private func prepareHeaderCell(_ tv: UITableView, indexPath: IndexPath, cellViewModel: HeaderCellViewModel) -> UITableViewCell {
        guard let headerCell = tv.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath)
                as? HeaderCell else {
            fatalError("Cell is not of kind \(HeaderCell.nameOfClass)")
        }
        headerCell.configure(with: cellViewModel)
        return headerCell
    }
    
    private func prepareDescriptionCell(_ tv: UITableView, indexPath: IndexPath, cellViewModel: DescriptionCellViewModel) -> UITableViewCell {
        guard let descriptionCell = tv.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath)
                as? DescriptionCell else {
            fatalError("Cell is not of kind \(DescriptionCell.nameOfClass)")
        }
        descriptionCell.configure(with: cellViewModel)
        return descriptionCell
    }
    
    private func prepareSizeCell(_ tv: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let sizeCell = tv.dequeueReusableCell(withIdentifier: SizeCell.identifier, for: indexPath)
                as? SizeCell else {
            fatalError("Cell is not of kind \(SizeCell.nameOfClass)")
        }
        return sizeCell
    }
    
}
