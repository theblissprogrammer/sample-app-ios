//
//  ShowEntryPresenter.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import QocBusinessLogic

struct ShowEntryPresenter: ShowEntryPresentable {
    private weak var viewController: ShowEntryDisplayable?
    
    private let calendar: Calendar
    private let releaseDateFormatter: DateFormatter
    
    init(viewController: ShowEntryDisplayable?) {
        self.viewController = viewController
        
        let calendar = Calendar(identifier: .gregorian)
        self.calendar = calendar
        self.releaseDateFormatter = DateFormatter().with {
            $0.dateFormat = "MM/dd/yyyy"
            $0.calendar = calendar
        }
    }
}

extension ShowEntryPresenter {
    
    func presentFetchedEntry(for response: ShowEntryModels.Response) {
        let viewModel = ShowEntryModels.ViewModel(
            name: response.entry.name,
            title: response.entry.title,
            iconUrl: response.entry.thumbnails.first { $0.height == "100" }?.link ?? "",
            releaseDate: releaseDateFormatter.string(from: response.entry.releaseDate),
            summary: response.entry.summary,
            price: .localizedStringWithFormat("%.2f \(response.entry.currency)", response.entry.price),
            category: response.entry.category?.name ?? "",
            link: response.entry.link,
            publisherName: response.entry.author?.name ?? "",
            publisherLink: response.entry.author?.link ?? ""
        )
        
        viewController?.displayFetchedEntry(with: viewModel)
    }
    
    func presentFetchedEntry(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: .localized(.entryErrorTitle),
            message: error.localizedDescription
        )
        
        viewController?.display(error: viewModel)
    }
}
