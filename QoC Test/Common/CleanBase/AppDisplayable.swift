//
//  AppDisplayable.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//

import UIKit

protocol AppDisplayable {
    func display(error: AppModels.Error)
    func displaySupport(error: AppModels.Error)
    
    func endRefreshing()
}

extension AppDisplayable {
    
    func display(error: AppModels.Error) {
        // Overridden by view controller for presenting alerts
    }
    
    func displaySupport(error: AppModels.Error) {
        // Present alert by default or supportable type will take over
        display(error: error)
    }
}

extension AppDisplayable where Self: UIViewController {
    
    func display(error: AppModels.Error) {
        endRefreshing()
        present(alert: error.title, message: error.message)
    }
    
    func endRefreshing() {
        #if !(WIDGET_EXT)
        hideSpinner()
        #endif
    }
}

#if !(WIDGET_EXT)

extension AppDisplayable where Self: UIViewController  {
    
    func displaySupport(error: AppModels.Error) {
        endRefreshing()
    }
}
#endif
