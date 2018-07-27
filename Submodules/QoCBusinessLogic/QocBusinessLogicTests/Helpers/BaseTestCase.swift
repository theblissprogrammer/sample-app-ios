//
//  BaseTestCase.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad 2018-07-27.
//

import XCTest
import QocBusinessLogic

class BaseTestCase: XCTestCase, DependencyConfigurator {
    
    override func setUp() {
        super.setUp()
        register(dependencies: TestDependency())
    }
    
    override func tearDown() {
        super.tearDown()
        register(dependencies: TestDependency())
    }
}
