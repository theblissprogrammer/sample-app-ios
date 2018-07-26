//
//  ShowEntryModels.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-26.
//

import QocBusinessLogic

enum ShowEntryModels {
    struct Request {
        let entryID: String
    }
    
    struct Response {
        let entry: EntryType
    }
    
    struct ViewModel {
        let title: String
        let iconUrl: String
        let releaseDate: String
        let summary: String
        let price: String
        let category: String
        let link: String
        let publisherName: String
        let publisherLink: String
    }
}
