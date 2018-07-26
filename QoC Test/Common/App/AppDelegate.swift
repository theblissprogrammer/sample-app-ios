//
//  AppDelegate.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import QocBusinessLogic
import ZamzamKit

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {

    override func services() -> [ApplicationService] {
        return [
            CoreApplicationService(),
            BootApplicationService(with: window),
            ThemeApplicationService()
        ]
    }
}
