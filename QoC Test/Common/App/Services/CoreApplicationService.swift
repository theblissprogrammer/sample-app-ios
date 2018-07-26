//
//  CoreApplicationService.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import QocBusinessLogic
import ZamzamKit

final class CoreApplicationService: ApplicationService, DependencyConfigurator {
    
}

extension CoreApplicationService {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        register(dependencies: AppDependency())
        return true
    }
}
