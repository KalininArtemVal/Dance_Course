//
//  Wireframe.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import RxSwift
import Foundation
import CoreLocation
import UIKit

enum RetryResult {
    case retry
    case cancel
}

protocol Wireframe {
    func open(url: URL)
    func presentWebPage(with url: URL)
    func promptFor<Action: CustomStringConvertible>(_ title: String, message: String, cancelAction: Action, actions: [Action]) -> Observable<Action>
}

protocol RouteBuildable {
    func buildRouteWithCoordinate(coordinate: CLLocationCoordinate2D)
}

protocol AlertShowable {
    func showInformationAlert(title: String?, message: String?)
    func showInformationAlert(title: String?, message: String?, completion: Action?, in presenter: Presentable?)
    func showLogoutAlert(logoutAction: Action?, in presenter: Presentable?)
    func showSuccessfulChangePasswordAlert(continueAction: Action?, in presenter: Presentable?)
    func showAddCardAlert(continueAction: Action?, in presenter: Presentable?)
    func showBlockCardAlert(continueAction: Action?, in presenter: Presentable?)
    func showSuccessfulSentCardAlert(continueAction: Action?, in presenter: Presentable?)
    func showFailureFavoriteDateAlert(selectionDate: String?, continueAction: Action?, in presenter: Presentable?)
    func showSuccessfulCompensationPointsAlert(continueAction: Action?, in presenter: Presentable?)
}

protocol ActionSheetShowable {
    func showSelectAuthorizationTypeActionSheet(onCardType: Action?, onPhoneType: Action?, in presenter: Presentable?)
    func showFeedBackActionSheet(onPhoneCall: Action?, onWriteMessage: Action?, in presenter: Presentable?)
    
    func showCardOperationActionSheet(onAdd: Action?, onBlock: Action?, onRepeatedlySending: Action?, in presenter: Presentable?)
    func showPhoneOperationsActionSheet(phoneNumber: String, onCall: Action?, onCopy: Action?, in presenter: Presentable?)
    func showStoreInteractionsActionSheet(phone: String, website: String, onCall: Action?, onWebsite: Action?, in presenter: Presentable?)
}

protocol StoreInfoViewShowable {
    func removeStoreView()
    func hideStoreViewIfNeeded()
    func unhideStoreViewIfNeeded()
}

class DefaultWireframe: Wireframe {

    static let shared = DefaultWireframe()
    
    let disposeBag = DisposeBag()

    func open(url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    func presentWebPage(with url: URL) {
//        let vc = SFSafariViewController(url: url)
//        DefaultWireframe.rootViewController().present(vc, animated: true)
    }

    static func rootViewController() -> UIViewController {
        return UIApplication.shared.keyWindow?.topUIViewController() ?? UIApplication.shared.keyWindow!.rootViewController!
    }

    static func routeToAuth() {
//        DispatchQueue.main.async {
//            UIView.animate(withDuration: 0.01) {
//                guard let keyWindow = UIApplication.shared.keyWindow,
//                      let rootViewController = keyWindow.rootViewController else { return }
//                weak var root = (rootViewController as? CustomNavigationController)?.viewControllers.first as? TabbarController
//                root?.reinitTabbarItems()
//                root?.finishFlow?()
//            }
//        }
    }

    static func presentAlert(_ title: String, message: String, completion: Action? = nil) {
        presentAlert(title, message: message, viewController: rootViewController(), completion: completion)
    }
    
    static func presentAlert(_ title: String, message: String, viewController: UIViewController, completion: Action? = nil) {
        #if os(iOS)
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
            completion?()
        })
        viewController.present(alertView, animated: true, completion: nil)
        #endif
    }

    func promptFor<Action : CustomStringConvertible>(_ title: String, message: String, cancelAction: Action, actions: [Action]) -> Observable<Action> {
        #if os(iOS)
            return Observable.create { observer in
                let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: cancelAction.description, style: .cancel) { _ in
                    observer.on(.next(cancelAction))
                })

                for action in actions {
                    alertView.addAction(UIAlertAction(title: action.description, style: .default) { _ in
                        observer.on(.next(action))
                    })
                }

                DefaultWireframe.rootViewController().present(alertView, animated: true, completion: nil)

                return Disposables.create {
                    alertView.dismiss(animated:false, completion: nil)
                }
            }
        #elseif os(macOS)
            return Observable.error(NSError(domain: "Unimplemented", code: -1, userInfo: nil))
        #endif
    }
}

extension RetryResult : CustomStringConvertible {
    var description: String {
        switch self {
        case .retry:
            return "Retry"
        case .cancel:
            return "Cancel"
        }
    }
}
