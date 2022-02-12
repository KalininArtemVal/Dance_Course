//
//  ProfileViewController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 12.02.2022.
//

import Rswift
import UIKit

final class ProfileViewController: BaseViewController, ProfileViewInput, ProfileViewOutput {

    // MARK: - LoaderViewInput

    // MARK: - LoaderViewOutput

    // MARK: - Views
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        view.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}
