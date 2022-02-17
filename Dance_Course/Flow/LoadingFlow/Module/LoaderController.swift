//
//  LoaderController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import Rswift
import RxRelay
import RxSwift
import UIKit

final class LoaderViewController: BaseViewController, LoaderViewInput, LoaderViewOutput {

    // MARK: - LoaderViewInput

    // MARK: - LoaderViewOutput

    // MARK: - Views
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = R.image.coffeeLoadView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let activeIndicator: UIActivityIndicatorView = {
        let activeIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activeIndicator.startAnimating()
        activeIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activeIndicator
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

    // MARK: - Actions

    // MARK: - Private Methods

    private func setupUI() {
        setupConstraints()
    }

    private func setupBindings() {
        
    }
    
    private func setupConstraints() {
        view.addSubview(imageView)
        view.addSubview(activeIndicator)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activeIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activeIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
}
