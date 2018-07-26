//
//  ShowEntryInteractor.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-26.
//

import QocBusinessLogic
import ZamzamKit

struct ShowEntryInteractor: ShowEntryBusinessLogic {
    private let presenter: ShowEntryPresentable
    private let entriesWorker: EntriesWorkerType
    
    init(
        presenter: ShowEntryPresentable,
        entriesWorker: EntriesWorkerType) {
        self.presenter = presenter
        self.entriesWorker = entriesWorker
    }
}

extension ShowEntryInteractor {
    
    func fetchEntry(with request: ShowEntryModels.Request) {
        entriesWorker.fetch(id: request.entryID) {
            guard let entry = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedEntry(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedEntry(
                for: ShowEntryModels.Response(
                    entry: entry
                )
            )
        }
    }
}
