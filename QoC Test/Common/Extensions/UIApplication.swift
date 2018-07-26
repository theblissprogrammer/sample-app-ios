//
//  UIApplication.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit

extension UIApplication {
    
    /**
     Get application window regardless of position in app lifecycle.
     */
    static func getWindow() -> UIWindow? {
        return UIApplication.shared.keyWindow
            ?? (UIApplication.shared.delegate as? AppDelegate)?.window
    }
}
