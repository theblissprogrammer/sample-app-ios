//
//  TestDependency.swift
//  QocBusinessLogic
//
//  Created by Basem Emara on 2018-06-12.
//

import QocBusinessLogic

class TestDependency: Dependency {
    
    override func resolveStore() -> PostsStore {
        return PostsMemoryStore()
    }
    
    override func resolveStore() -> TaxonomyStore {
        return TaxonomyMemoryStore()
    }
    
    override func resolveStore() -> AuthorsStore {
        return AuthorsMemoryStore()
    }
    
    override func resolveStore() -> MediaStore {
        return MediaMemoryStore()
    }
}
