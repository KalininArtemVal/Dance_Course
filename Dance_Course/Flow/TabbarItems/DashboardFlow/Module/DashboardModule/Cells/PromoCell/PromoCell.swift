//
//  PromoCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 23.02.2022.
//

import Rswift
import RxSwift
import RxRelay
import RxDataSources
import UIKit

class PromoCell: UITableViewCell, UIScrollViewDelegate {
    
    static let identifier = "PromoCell"
    
    var viewModel = PromoCellViewModel()
    
    private var disposeBag = DisposeBag()
    
    var collectionEdgeInsets: UIEdgeInsets?
    
    var contentOffset: ((CGPoint) -> Void)?
    
    private var selectedCell = 0
    
    var onSelected: DrinksTypeAction?
    
    // MARK: -  Private properties
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blackColor
//        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
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
    
    // MARK: - Private methods
    
    private func setupUI() {
        registerCell()
        setupConstraints()
        setupBindings()
        
        collectionView.selectItem(at: IndexPath(item: selectedCell, section: 0),
                                  animated: false,
                                  scrollPosition: .left)
    }
    
    private func setupBindings() {
        let dataSource = self.dataSource()
        self.viewModel.sections.bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)

        self.collectionView.rx.setDelegate(self)
            .disposed(by: self.disposeBag)
    }
    
    private func registerCell() {
        collectionView.register(PromoItemCell.self, forCellWithReuseIdentifier: PromoItemCell.identifier)
    }
    
    private func setupConstraints() {
        contentView.addSubview(collectionView)
        contentView.backgroundColor = .blackColor
        collectionView.backgroundColor = .blackColor
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}

extension PromoCell {
    
    private func dataSource() -> RxCollectionViewSectionedReloadDataSource<PromoSectionModel> {
        return RxCollectionViewSectionedReloadDataSource<PromoSectionModel>(
            configureCell: { [weak self] (_, cv, indexPath, item) -> UICollectionViewCell in
                guard let self = self else {
                    return cv.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.nameOfClass, for: indexPath)
                }
                switch item {
                case .promoItem(vm: let cellVM):
                    return self.preparePromoItemCell(cv, indexPath: indexPath, cellViewModel: cellVM)
                }
            }
        )
    }
    
    private func preparePromoItemCell(_ cv: UICollectionView, indexPath: IndexPath, cellViewModel: PromoItemViewModel) -> UICollectionViewCell {
        guard let cell = cv.dequeueReusableCell(withReuseIdentifier: PromoItemCell.identifier, for: indexPath)
                as? PromoItemCell else {
            fatalError("Cell is not of kind \(PromoItemCell.nameOfClass)")
        }
        
        cell.configure(with: cellViewModel)
        
        return cell
    }
    
}

extension PromoCell {
    private func bindOffset(contentOffset: CGPoint) {
        collectionView.setContentOffset(contentOffset, animated: false)
    }
}

extension PromoCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return collectionEdgeInsets ?? UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 40
        let height = CGFloat(150)
        return CGSize(width: width, height: height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard (scrollView as? UICollectionView) == collectionView else {
            return
        }
        contentOffset?(collectionView.contentOffset)
    }
}
