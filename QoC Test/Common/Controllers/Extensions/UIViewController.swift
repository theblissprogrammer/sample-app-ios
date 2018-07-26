//
//  UIViewController.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//

import UIKit
import ZamzamKit

extension UIViewController {
    
    /// Determines if currently being presented from another view controllor
    var isPresenting: Bool {
        return presentingViewController != nil
            || navigationController?.presentingViewController?.presentedViewController === navigationController
            || tabBarController?.presentingViewController is UITabBarController
    }
    
    /**
     Open Safari view controller overlay.
     
     - parameter url: URL to display in the browser.
     - parameter modalPresentationStyle: The presentation style of the model view controller.
     */
    func present(url: String, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(
            safari: url,
            barTintColor: UINavigationBar.appearance().barTintColor,
            preferredControlTintColor: UINavigationBar.appearance().tintColor
        )
    }
}
