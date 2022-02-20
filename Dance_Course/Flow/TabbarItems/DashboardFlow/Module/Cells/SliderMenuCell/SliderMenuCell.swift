//
//  SliderMenuCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 20.02.2022.
//

import Rswift
import RxSwift
import RxRelay
import RxDataSources
import UIKit

class SliderMenuCell: UITableViewCell, UIScrollViewDelegate {
    
    static let identifier = "SliderMenuCell"
    
    var viewModel = SliderMenuViewModel()
    
    private var sections: BehaviorRelay<[SliderMenuSectionModel]> = BehaviorRelay(value: [])
    
    private var disposeBag = DisposeBag()
    
    var collectionEdgeInsets: UIEdgeInsets?
    
    var contentOffset: ((CGPoint) -> Void)?
    
    // MARK: -  Private properties
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
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
    }
    
    private func setupBindings() {
        let dataSource = self.dataSource()
        self.viewModel.sections.bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)

        self.collectionView.rx.setDelegate(self)
            .disposed(by: self.disposeBag)
    }
    
    private func registerCell() {
        collectionView.register(SliderMenuItemCell.self, forCellWithReuseIdentifier: SliderMenuItemCell.identifier)
    }
    
    private func setupConstraints() {
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

extension SliderMenuCell {
    
    private func dataSource() -> RxCollectionViewSectionedReloadDataSource<SliderMenuSectionModel> {
        return RxCollectionViewSectionedReloadDataSource<SliderMenuSectionModel>(
            configureCell: { [weak self] (_, cv, indexPath, item) -> UICollectionViewCell in
                guard let self = self else {
                    return cv.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.nameOfClass, for: indexPath)
                }
                switch item {
                case .menuItem(vm: let cellViewModel):
                    return self.prepareSliderMenuItemCell(cv, indexPath: indexPath, cellViewModel: cellViewModel)
                }
            }
        )
    }
    
    private func prepareSliderMenuItemCell(_ cv: UICollectionView, indexPath: IndexPath, cellViewModel: SliderMenuItemViewModel) -> UICollectionViewCell {
        guard let cell = cv.dequeueReusableCell(withReuseIdentifier: SliderMenuItemCell.identifier, for: indexPath)
                as? SliderMenuItemCell else {
            fatalError("Cell is not of kind \(SliderMenuItemCell.nameOfClass)")
        }
        
        cell.configure(vm: cellViewModel)
        
        return cell
    }
    
}

extension SliderMenuCell {
    private func bindOffset(contentOffset: CGPoint) {
        collectionView.setContentOffset(contentOffset, animated: false)
    }
}

extension SliderMenuCell: UICollectionViewDelegateFlowLayout {
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
        let width = UIScreen.main.bounds.width / 3 - 30
        let height = CGFloat(40)
        return CGSize(width: width, height: height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard (scrollView as? UICollectionView) == collectionView else {
            return
        }
        contentOffset?(collectionView.contentOffset)
    }
}
