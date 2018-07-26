//
//  AppRoutable.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import QocBusinessLogic
import ZamzamKit

protocol AppRoutable: Router {
    var viewController: UIViewController? { get set }
    
    func dismiss()
    func exit()
}

// MARK: - Helper functions

extension AppRoutable {
    
    private var rootController: UITabBarController? {
        return UIApplication.getWindow()?.rootViewController as? UITabBarController
    }
    
    func present<T: UIViewController>(storyboard: Storyboard, identifier: String? = nil, animated: Bool = true, modalPresentationStyle: UIModalPresentationStyle? = nil, modalTransitionStyle: UIModalTransitionStyle? = nil, configure: ((T) -> Void)? = nil, completion: ((T) -> Void)? = nil) {
        present(storyboard: storyboard.rawValue, identifier: identifier, animated: animated, modalPresentationStyle: modalPresentationStyle, modalTransitionStyle: modalTransitionStyle, configure: configure, completion: completion)
    }
    
    func show<T: UIViewController>(storyboard: Storyboard, identifier: String? = nil, configure: ((T) -> Void)? = nil) {
        show(storyboard: storyboard.rawValue, identifier: identifier, configure: configure)
    }
}

extension AppRoutable {
    
    /// Shows the main screen of the specified tab.
    ///
    /// - Parameters:
    ///   - tab: The tab to select.
    ///   - configure: Configure the view controller before it is loaded.
    ///   - completion: Completion the view controller after it is loaded.
    func show<T: UIViewController>(tab: TabStoryboard, configure: ((T) -> Void)? = nil, completion: ((T) -> Void)? = nil) {
        guard let tabBarController = rootController else { return }
        
        // Dismiss any alerts if applicable
        tabBarController.dismiss(animated: false, completion: nil)
        
        // Determine destination controller
        guard let controller: T = {
            // Get root navigation controller of tab if applicable
            guard let navigationController = tabBarController
                .viewControllers?.get(tab.rawValue) as? UINavigationController
                else { return tabBarController.viewControllers?.get(tab.rawValue) as? T }
            
            return navigationController.viewControllers.first as? T
            }() else {
                // Select tab before exiting any way
                tabBarController.selectedIndex = tab.rawValue
                return
        }
        
        configure?(controller)
        
        // Select tab
        tabBarController.selectedIndex = tab.rawValue
        
        // Pop all views of navigation controller to go to root
        (tabBarController.selectedViewController as? UINavigationController)?
            .popToRootViewController(animated: false)
        
        completion?(controller)
    }
    
    func dismiss() {
        guard let navController = viewController?.navigationController else {
            viewController?.dismiss(animated: true)
            return
        }
        
        guard navController.viewControllers.count > 1 else {
            return navController.dismiss(animated: true)
        }
        
        navController.popViewController(animated: true)
    }
    
    func exit() {
        (viewController?.navigationController ?? viewController)?.dismiss(animated: true)
    }
}

/// Storyboard identifiers for routing
enum Storyboard: String {
    case main = "Main"
    case entries = "Entries"
    case showEntry = "ShowEntry"
    case listEntries = "ListEntries"
}

enum TabStoryboard: Int {
    case entries = 0
}

