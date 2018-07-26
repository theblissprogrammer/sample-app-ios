//
//  ListEntriesInteractor.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//

import SwiftyPress

struct ListEntriesInteractor: ListEntriesBusinessLogic {
    private let presenter: ListEntriesPresentable
    private let entriesWorker: EntriesWorkerType
    
    init(presenter: ListEntriesPresentable, entriesWorker: EntriesWorkerType) {
        self.presenter = presenter
        self.entriesWorker = entriesWorker
    }
}

extension ListEntriesInteractor {
    
    func fetchEntries() {
        entriesWorker.fetch {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedEntries(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedEntries(
                for: ListEntriesModels.Response(entries: value)
            )
        }
    }
}
