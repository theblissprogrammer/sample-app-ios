//
//  EntriesDataViewDelegate.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import ZamzamKit

protocol EntriesDataViewDelegate: class {
    func entriesDataView(didSelect model: EntryDataViewModel, at indexPath: IndexPath, from dataView: DataViewable)
    func entriesDataViewDidReloadData()
    func entriesDataViewWillBeginDragging(_ scrollView: UIScrollView)
    func entriesDataViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
}

// Optional conformance
extension EntriesDataViewDelegate {
    func postsDataViewDidReloadData() {}
    func postsDataViewWillBeginDragging(_ scrollView: UIScrollView) {}
    func postsDataViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {}
}
