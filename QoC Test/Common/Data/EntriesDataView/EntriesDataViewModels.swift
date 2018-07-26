//
//  EntryDataViewModel.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

struct EntryDataViewModel {
    let id: String
    let title: String
    let imageURL: String?
}

protocol EntriesDataViewCell {
    func bind(_ model: EntryDataViewModel)
}
