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

