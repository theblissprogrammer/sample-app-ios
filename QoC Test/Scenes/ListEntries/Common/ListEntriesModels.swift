//
//  ListEntriesModels.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//

import SwiftyPress

enum ListEntriesModels {
    
    struct Response {
        let entries: [EntryType]
    }
    
    struct ViewModel {
        let entries: [EntryDataViewModel]
        
        init(entries: [EntryDataViewModel] = []) {
            self.entries = entries
        }
    }
}
