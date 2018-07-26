//
//  EntriesDataViewAdapter.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import ZamzamKit

class EntriesDataViewAdapter: NSObject {
    private weak var delegate: EntriesDataViewDelegate?
    private let dataView: DataViewable
    private(set) var viewModels = [EntryDataViewModel]()
    
    init(delegate: EntriesDataViewDelegate? = nil, for dataView: DataViewable) {
        self.delegate = delegate
        self.dataView = dataView
        
        super.init()
        
        // Set data view delegates
        if let tableView = dataView as? UITableView {
            tableView.delegate = self
            tableView.dataSource = self
        } else if let collectionView = dataView as? UICollectionView {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
}

extension EntriesDataViewAdapter {
    
    func reloadData(with viewModels: [EntryDataViewModel]) {
        self.viewModels = viewModels
        
        dataView.reloadData()
        delegate?.entriesDataViewDidReloadData()
    }
}

// MARK: - UITableView delegates

extension EntriesDataViewAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //Handle cell highlight
        
        let model = viewModels[indexPath.row]
        delegate?.entriesDataView(didSelect: model, at: indexPath, from: tableView)
    }
}

extension EntriesDataViewAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView[indexPath]
        (cell as? EntriesDataViewCell)?.bind(viewModels[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionView delegates

extension EntriesDataViewAdapter: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true) //Handle cell highlight
        
        let model = viewModels[indexPath.row]
        delegate?.entriesDataView(didSelect: model, at: indexPath, from: collectionView)
    }
}

extension EntriesDataViewAdapter: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView[indexPath]
        (cell as? EntriesDataViewCell)?.bind(viewModels[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionView delegates

extension EntriesDataViewAdapter {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegate?.entriesDataViewWillBeginDragging(scrollView)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        delegate?.entriesDataViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
}
