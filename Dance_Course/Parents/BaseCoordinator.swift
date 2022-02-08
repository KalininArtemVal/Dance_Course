//
//  BaseCoordinator.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import RxSwift
import Foundation

class BaseCoordinator: Coordinatable {

    var childCoordinators: [Coordinatable] = []
    
    // MARK: - Coordinatable
    
    var finishFlow: Action?
    func start() {}

    /// Utility `DisposeBag` used by the subclasses.
    let disposeBag = DisposeBag()

    // add only unique object
    func addDependency(_ coordinator: Coordinatable) {
        for element in childCoordinators where element === coordinator {
             return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinatable?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
                childCoordinators.remove(at: index)
                break
        }
    }
    
    // MARK: - Life Cycle
    
    deinit {
        print("\(NSStringFromClass(type(of: self)).components(separatedBy: ".").last!) deinit")
    }
}
