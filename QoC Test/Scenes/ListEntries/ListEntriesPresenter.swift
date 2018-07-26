//
//  ListEntriesPresenter.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//

import UIKit
import QocBusinessLogic
import ZamzamKit

struct ListEntriesPresenter: ListEntriesPresentable {
    private weak var viewController: ListEntriesDisplayable?
    
    init(viewController: ListEntriesDisplayable?) {
        self.viewController = viewController
    }
}

extension ListEntriesPresenter {
    
    func presentFetchedEntries(for response: ListEntriesModels.Response) {
        let viewModel = ListEntriesModels.ViewModel(
            entries: response.entries.map { make(from: $0) }
        )
        
        viewController?.displayFetchedEntries(with: viewModel)
    }
    
    func presentFetchedEntries(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: .localized(.entryErrorTitle),
            message: error.localizedDescription
        )
        
        viewController?.display(error: viewModel)
    }
}

private extension ListEntriesPresenter {
    
    func make(from object: EntryType) -> EntryDataViewModel {
        return EntryDataViewModel(
            id: object.id,
            title: object.title,
            imageURL: object.thumbnails.first { $0.height == "75" }?.link ?? ""
        )
    }
}

