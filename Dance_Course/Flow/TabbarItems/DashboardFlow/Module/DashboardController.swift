//
//  DashboardController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import Rswift
import UIKit

final class DashboardViewController: BaseViewController, DashboardViewInput, DashboardViewOutput {

    // MARK: - LoaderViewInput

    // MARK: - LoaderViewOutput

    // MARK: - Views
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
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
