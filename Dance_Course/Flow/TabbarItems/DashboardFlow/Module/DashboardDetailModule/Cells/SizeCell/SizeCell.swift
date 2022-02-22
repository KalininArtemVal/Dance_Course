//
//  SizeCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 23.02.2022.
//

import Rswift
import RxSwift
import RxRelay
import RxDataSources
import UIKit

class SizeCellViewModel {
    var items: [String] = ["S", "M", "L"]
}

class SizeCell: UITableViewCell, UIScrollViewDelegate, UICollectionViewDataSource {
    
    static let identifier = "SizeCell"
    
    var viewModel = SizeCellViewModel()
    
    private var disposeBag = DisposeBag()
    
    var collectionEdgeInsets: UIEdgeInsets?
    
    var contentOffset: ((CGPoint) -> Void)?
    
    private var selectedCell = 0
    
    var onSelected: DrinksTypeAction?
    
    // MARK: -  Private properties
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Size"
        label.font = .sizeFont
        label.textColor = .whiteColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
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
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func registerCell() {
        collectionView.register(SizeItemCell.self, forCellWithReuseIdentifier: SizeItemCell.identifier)
    }
    
    private func setupConstraints() {
        contentView.addSubview(collectionView)
        contentView.addSubview(sizeLabel)
        contentView.backgroundColor = .blackColor
        backgroundColor = .blackColor
        collectionView.backgroundColor = .blackColor
        
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            sizeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}

extension SizeCell {
    
    private func bindOffset(contentOffset: CGPoint) {
        collectionView.setContentOffset(contentOffset, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeItemCell.identifier, for: indexPath)
                as? SizeItemCell else {
            fatalError("Cell is not of kind \(SizeItemCell.nameOfClass)")
        }
        let item = viewModel.items[indexPath.row]
        
        cell.configure(with: item)
        return cell
    }
}

extension SizeCell: UICollectionViewDelegateFlowLayout {
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
        let width = UIScreen.main.bounds.width / 3 - 15
        let height = CGFloat(70)
        return CGSize(width: width, height: height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard (scrollView as? UICollectionView) == collectionView else {
            return
        }
        contentOffset?(collectionView.contentOffset)
    }
}
