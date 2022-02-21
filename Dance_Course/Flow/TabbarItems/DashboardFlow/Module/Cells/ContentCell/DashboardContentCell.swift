//
//  DashboardContentCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 17.02.2022.
//
import Rswift
import RxSwift
import RxRelay
import RxDataSources
import UIKit

class DashboardContentCell: UITableViewCell {
    
    static let identifier = "DashboardContentCell"
    
    var viewModel = DashboardContentViewModel()
    
    private var sections: BehaviorRelay<[ContentSectionModel]> = BehaviorRelay(value: [])
    
    private var disposeBag = DisposeBag()
    
    var collectionEdgeInsets: UIEdgeInsets?
    
    var contentOffset: ((CGPoint) -> Void)?
    
    var isItemSelected = BehaviorRelay<Bool>(value: false)
    
    // MARK: -  Private properties
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blackColor
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(type: DrinksType) {
        setContentHeight()
        hideCollection { [weak self] in
            self?.viewModel.setItems(with: type)
            self?.collectionView.reloadData()
        }
        showCollection()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .blackColor
        registerCell()
        setupConstraints()
        setupBindings()
    }
    
    private func hideCollection(completion: Action?) {
        UIView.animate(withDuration: 0.7) {
            self.collectionView.alpha = 0
        }
        completion?()
    }
    
    private func showCollection() {
        UIView.animate(withDuration: 0.7) {
            self.collectionView.alpha = 1
        }
    }
    
    private func setupBindings() {
        let dataSource = self.dataSource()
        self.viewModel.sections.bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)

        self.collectionView.rx.setDelegate(self)
            .disposed(by: self.disposeBag)
        self.viewModel.isItemSelected.asObservable().subscribe { [weak self] event in
            guard let event = event.element else { return }
            if event {
                self?.setContentHeight()
                self?.isItemSelected.accept(event)
            }
        }.disposed(by: self.disposeBag)
    }
    
    private func registerCell() {
        collectionView.register(ContentCollectionCell.self, forCellWithReuseIdentifier: ContentCollectionCell.identifier)
    }
    
    private func setupConstraints() {
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .blackColor
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
    
    private func setContentHeight() {
        self.viewModel.itemsCount.asObservable().subscribe { [weak self] count in
            guard let count = count.element else { return }
            
//            var a = CGFloat(250)count % 2
            
            var collectionHeight = CGFloat(0)
            
            collectionHeight = count
            print(collectionHeight)
            self?.collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        }.disposed(by: disposeBag)
    }
    
}

extension DashboardContentCell {
    
    private func dataSource() -> RxCollectionViewSectionedReloadDataSource<ContentSectionModel> {
        return RxCollectionViewSectionedReloadDataSource<ContentSectionModel>(
            configureCell: { [weak self] (_, cv, indexPath, item) -> UICollectionViewCell in
                guard let self = self else {
                    return cv.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.nameOfClass, for: indexPath)
                }
                switch item {
                case .coffeeItem(vm: let cellVM):
                    return self.prepareContentCell(cv, indexPath: indexPath, cellViewModel: cellVM)
                }
            }
        )
    }
    
    private func prepareContentCell(_ cv: UICollectionView, indexPath: IndexPath, cellViewModel: ContentContentViewModel) -> UICollectionViewCell {
        guard let cell = cv.dequeueReusableCell(withReuseIdentifier: ContentCollectionCell.identifier, for: indexPath)
                as? ContentCollectionCell else {
            fatalError("Cell is not of kind \(ContentCollectionCell.nameOfClass)")
        }
        
        cell.configure(with: cellViewModel)
        return cell
    }
    
}

extension DashboardContentCell {
    private func bindOffset(contentOffset: CGPoint) {
        collectionView.setContentOffset(contentOffset, animated: false)
    }
}

extension DashboardContentCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionEdgeInsets ?? UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 2 - 30
        let height = CGFloat(250)
        return CGSize(width: width, height: height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard (scrollView as? UICollectionView) == collectionView else {
            return
        }
        contentOffset?(collectionView.contentOffset)
    }
}
