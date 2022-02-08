//
//  BaseViewController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import RxSwift
import UIKit

class BaseViewController: UIViewController {

    // MARK: - Properties

    // Utility `DisposeBag` used by the subclasses.

    let disposeBag = DisposeBag()

    // MARK: - Private properties
    
    private lazy var waitingView: WaitingScreenView = {
        // when we don't have custom view as navigation view - need to use with insets
        // when we have a custom navigation view - need to show on the containerView without any insets
        var topInset: CGFloat = Constants.navigationViewHeight
        if containerView != nil {
            topInset = 0
        }
        let frame = UIScreen.main.bounds.inset(by: UIEdgeInsets(top: topInset,
                                                                left: 0,
                                                                bottom: 0,
                                                                right: 0))
        let view = WaitingScreenView(frame: frame)
        return view
    }()
    
    @IBOutlet private weak var containerView: UIView!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        handleTapBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        print("\(self.nameOfClass) deinit")
    }
    
    // MARK: - Public methods
    
    func updateContainerViewBackgroundColor(color: UIColor) {
        containerView.backgroundColor = color
    }
    // MARK: - Gestures

    func handleTapBackground() {
        let tapBackground = UITapGestureRecognizer()
        tapBackground.cancelsTouchesInView = false
        tapBackground.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.view.endEditing(true)
            })
            .disposed(by: disposeBag)
        view.addGestureRecognizer(tapBackground)
    }
}

extension BaseViewController {
    func keyboardHeightObservable() -> Observable<CGFloat> {
        return Observable
            .from([
                NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
                    .map { notification -> CGFloat in
                        (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
                },
                NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
                    .map { _ -> CGFloat in
                        0
                }
                ])
            .merge()
    }
}

// MARK: - Waiting Screen

extension BaseViewController {
    
    func showWaitingScreen() {
        if waitingView.superview == nil {
            if let containerView = self.containerView {
                containerView.addSubview(waitingView)
            } else {
                view.addSubview(waitingView)
            }
        }
    }

    func hideWaitingScreen() {
        waitingView.removeFromSuperview()
    }
    
    func showBackgroundNetworkActivity() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideBackgroundNetworkActivity() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
