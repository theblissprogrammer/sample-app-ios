//
//  UIViewController+Spinner.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//

import UIKit
import PKHUD

extension UIViewController {
    
    /// Displays heads-up display for waiting period.
    ///
    /// - Parameters:
    ///   - type: Type of spinner to display.
    ///   - delay: Amount of time to display the spinner.
    func showSpinner(for type: HUDContentType = .progress, delay: TimeInterval = 10) {
        endEditing()
        
        guard delay > 0 else { return HUD.flash(type, delay: delay) }
        HUD.flash(type, delay: delay)
    }
    
    /// Displays heads-up display for waiting period.
    ///
    /// - Parameters:
    ///   - label: Text to display for the spinner.
    ///   - delay: Amount of time to display the spinner.
    func showSpinner(label: String, delay: TimeInterval = 10) {
        showSpinner(for: .label(label), delay: delay)
    }
    
    /// Displays heads-up display for waiting period.
    ///
    /// - Parameters:
    ///   - progress: Text to display for the spinner.
    ///   - subtitle: Text to display for the spinner subtitle.
    ///   - delay: Amount of time to display the spinner.
    func showSpinner(progress: String, subtitle: String? = nil, delay: TimeInterval = 10) {
        showSpinner(for: .labeledProgress(title: progress, subtitle: subtitle), delay: delay)
    }
    
    /// Displays heads-up display for waiting period.
    ///
    /// - Parameters:
    ///   - success: Text to display for the spinner.
    ///   - subtitle: Text to display for the spinner subtitle.
    ///   - delay: Amount of time to display the spinner.
    func showSpinner(success: String, subtitle: String? = nil, delay: TimeInterval = 1.5) {
        showSpinner(for: .labeledSuccess(title: success, subtitle: subtitle), delay: delay)
    }
    
    /// Displays heads-up display for waiting period.
    ///
    /// - Parameters:
    ///   - error: Text to display for the spinner.
    ///   - subtitle: Text to display for the spinner subtitle.
    ///   - delay: Amount of time to display the spinner.
    func showSpinner(error: String, subtitle: String? = nil, delay: TimeInterval = 3) {
        showSpinner(for: .labeledError(title: error, subtitle: subtitle), delay: delay)
    }
    
    /// Hides the head-up display.
    func hideSpinner() {
        HUD.hide()
    }
}
