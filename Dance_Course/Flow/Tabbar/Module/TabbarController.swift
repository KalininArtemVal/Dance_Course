//
//  TabbarController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import UIKit

final class TabbarController: UITabBarController, TabbarViewInput, TabbarViewOutput, UITabBarControllerDelegate {
    
    
    // MARK: - TabbarViewInput

    var onFlow: ((CustomNavigationController, TabbarItemType) -> Void)?
    
    var onViewDidLoad: ((CustomNavigationController) -> Void)?
    
    var finishFlow: Action?
    
    // MARK: - Overriden properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return selectedViewController?.preferredStatusBarStyle ?? .default
    }
    

    // MARK: - Private properties
    
    private let model = AppTabBarModel()
    
    private let generator = UIImpactFeedbackGenerator(style: .medium)
    
    private var requiresReinit: Set<Int> = Set()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        delegate = self
        print(customizableViewControllers?.first)
        if let controller = customizableViewControllers?.first as? CustomNavigationController {
            onViewDidLoad?(controller)
        }
    }
    
    deinit {
        print("TabbarController deinit")
    }
    
    // MARK: - Private methods

    private func setupUI() {
        if let items = self.tabBar.items {
            for (index, item) in items.enumerated() {
                switch TabbarItemType(rawValue: index) {
                case .dashboard?:
                    item.title = "Tabbar.Item.Dashboard.Title".localized
//                    item.selectedImage = R.image.dashboardTabIconActive()?.withRenderingMode(.alwaysOriginal)
//                    item.image = R.image.dashboardTabIcon()?.withRenderingMode(.alwaysOriginal)
                case .profile?:
                    item.title = "Tabbar.Item.Profile.Title".localized
//                    item.selectedImage = R.image.profileTabIconActive()?.withRenderingMode(.alwaysOriginal)
//                    item.image = R.image.profileTabIcon()?.withRenderingMode(.alwaysOriginal)

                default: break
                }
            }
        }
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.tabFont,
//                                                          NSAttributedString.Key.foregroundColor: UIColor.labelDarkPrimaryColor], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.tabFont,
//                                                          NSAttributedString.Key.foregroundColor: UIColor.labelDarkPrimaryColor], for: .selected)
    }
    
    func updateTabbarItem(with item: TabbarItemType, completion: Action?) {
        guard let controller = viewControllers?[item.rawValue] as? CustomNavigationController else { return }
        selectedIndex = item.rawValue
        onFlow?(controller, item)
        requiresReinit.insert(selectedIndex)
        completion?()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? CustomNavigationController else { return }
        onFlow?(controller, TabbarItemType(rawValue: selectedIndex)!)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    // MARK: - UITabBarControllerDelegate
    
}



// MARK: - CollectionView DataSource
extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = Constants.tabbarHeight
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            if let bottomPadding = window?.safeAreaInsets.bottom {
                sizeThatFits.height += bottomPadding
            }
        }
        return sizeThatFits
    }
    
}

extension TabbarController {

    func reinitTabbarItems() {
        viewControllers?.forEach {
            if viewControllers?[selectedIndex] != $0 {
                guard let controller = $0 as? CustomNavigationController else { return }
                controller.viewControllers.removeAll()
            }
        }
    }

    func updateTabbarItem(with item: TabbarItemType) {
        guard let controller = viewControllers?[item.rawValue] as? CustomNavigationController else { return }
        selectedIndex = item.rawValue
        onFlow?(controller, item)
    }
}
