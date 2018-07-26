//
//  ListEntriesStoreInterfaces.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//

import SwiftyPress

protocol ListEntriesDisplayable: class, AppDisplayable {
    func displayFetchedEntries(with viewModel: ListEntriesModels.ViewModel)
}

protocol ListEntriesBusinessLogic {
    func fetchEntries()
}

protocol ListEntriesPresentable {
    func presentFetchedEntries(for response: ListEntriesModels.Response)
    func presentFetchedEntries(error: DataError)
}

protocol ListEntriesRoutable {
    func showEntry(id: String)
}

// MARK: - Delegates

protocol SelectedEntryDelegate: class {
    func selectedEntry(didSelect entryID: Int)
}
