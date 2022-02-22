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
    
    var contentCount = BehaviorRelay<Int>(value: 0)
    
    private var isFiltering = false
    
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
        hideCollection { [weak self] in
            self?.isFiltering = true
            self?.filterItems(with: type)
            self?.collectionView.reloadData()
        }
        showCollection()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .blackColor
        registerCell()
        setupConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    func filterItems(with type: DrinksType) {
        guard type != .all else {
            viewModel.filterItems = viewModel.contentItems
            setContentHeight(with: viewModel.filterItems.count)
            contentCount.accept(viewModel.filterItems.count)
            return
        }
        viewModel.filterItems = viewModel.contentItems.filter({
            (content: ContentContentViewModel) -> Bool in
            if !viewModel.filterItems.isEmpty {
                viewModel.filterItems = []
            }
            if content.drinksType == type {
                print(content.drinksType)
                viewModel.filterItems.append(content)
                
            }
            contentCount.accept(viewModel.filterItems.count)
            return content.drinksType == type
        })
        setContentHeight(with: viewModel.filterItems.count)
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
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setContentHeight(with count: Int) {
        var columnElement: CGFloat = 0
        var collectionHeight: CGFloat = 0
        
        if count % 2 == 0 {
            columnElement = CGFloat(count / 2)
            collectionHeight = 250 * (columnElement)
        } else {
            columnElement = CGFloat(count / 2) + CGFloat(0.5)
            collectionHeight = 250 * (columnElement + 0.5)
        }
        print(collectionHeight)
        self.collectionView.heightAnchor.constraint(equalToConstant: collectionHeight + Constants.tabbarHeight).isActive = true
    }
    
}

extension DashboardContentCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return viewModel.filterItems.count
        }
        return viewModel.contentItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionCell.identifier, for: indexPath)
                as? ContentCollectionCell else {
            fatalError("Cell is not of kind \(ContentCollectionCell.nameOfClass)")
            
        }
        
        if isFiltering {
            let cellViewModel = viewModel.filterItems[indexPath.row]
            cell.configure(with: cellViewModel)
        } else {
            let cellViewModel = viewModel.contentItems[indexPath.row]
            cell.configure(with: cellViewModel)
        }
        
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
