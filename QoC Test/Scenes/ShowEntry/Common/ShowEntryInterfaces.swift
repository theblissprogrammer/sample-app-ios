//
//  ShowEntryInterfaces.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-26.
//

import QocBusinessLogic

protocol ShowEntryDisplayable: class, AppDisplayable {
    func displayFetchedEntry(with viewModel: ShowEntryModels.ViewModel)
}

protocol ShowEntryBusinessLogic {
    func fetchEntry(with request: ShowEntryModels.Request)
}

protocol ShowEntryPresentable {
    func presentFetchedEntry(for response: ShowEntryModels.Response)
    func presentFetchedEntry(error: DataError)
}
