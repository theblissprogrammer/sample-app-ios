//
//  TestDependency.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad 2018-07-27.
//

import QocBusinessLogic

class TestDependency: Dependency {
    
    override func resolveStore() -> EntriesStore {
        return EntriesMemoryStore()
    }
}
