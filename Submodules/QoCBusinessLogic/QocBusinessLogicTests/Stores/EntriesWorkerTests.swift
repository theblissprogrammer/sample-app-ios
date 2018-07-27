//
//  EntriesWorkerTests.swift
//  QoCBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-27.
//

import XCTest
import ZamzamKit
@testable import QocBusinessLogic

class EntriesWorkerTests: BaseTestCase, HasDependencies {
    
    private lazy var entriesWorker: EntriesWorkerType = dependencies.resolveWorker()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

extension EntriesWorkerTests {
    
    func testFetch() {
        let promise = expectation(description: "Entries fetch all promise")
        
        entriesWorker.fetch {
            defer { promise.fulfill() }
            
            guard let value = $0.value, $0.isSuccess else {
                return XCTFail("Entries fetch all error: \(String(describing: $0.error))")
            }
            
            XCTAssertTrue(!value.isEmpty)
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

extension EntriesWorkerTests {
    
    func testFetchByID() {
        let promise = expectation(description: "Entries fetch by ID promise")
        let id = 1
        
        entriesWorker.fetch(id: id) {
            defer { promise.fulfill() }
            
            guard let value = $0.value, $0.isSuccess else {
                return XCTFail("Entries fetch by ID error: \(String(describing: $0.error))")
            }
            
            XCTAssertTrue(value.id == id)
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchByIDError() {
        let promise = expectation(description: "Entries fetch by ID error promise")
        let id = 999
        
        entriesWorker.fetch(id: id) {
            defer { promise.fulfill() }
            
            guard case .nonExistent? = $0.error else {
                return XCTFail("Entries fetch by ID error should have failed.")
            }
            
            XCTAssertTrue(true)
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

