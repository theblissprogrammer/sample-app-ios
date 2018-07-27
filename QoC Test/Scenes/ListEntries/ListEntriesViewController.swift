//
//  ListEntriesViewController.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import QocBusinessLogic
import ZamzamKit

class ListEntriesViewController: UIViewController, HasDependencies {
    
    // MARK: - Controls
    
    @IBOutlet weak var tableView: UITableView! {
        didSet { tableView.register(nib: ListEntriesTableViewCell.self) }
    }
    
    // MARK: - VIP variables
    
    private lazy var interactor: ListEntriesBusinessLogic = ListEntriesInteractor(
        presenter: ListEntriesPresenter(viewController: self),
        entriesWorker: dependencies.resolveWorker()
    )
    
    private lazy var router: ListEntriesRoutable = ListEntriesRouter(
        viewController: self
    )
    
    // MARK: - Internal variables
    private lazy var dataViewAdapter: EntriesDataViewAdapter = EntriesDataViewAdapter(
        delegate: self,
        for: tableView
    )
    
    weak var selectedEntryDelegate: SelectedEntryDelegate?
    
    // MARK: - Controller cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
}

// MARK: - Events

private extension ListEntriesViewController {
    
    func configure() {
        title = .localized(.entryTitle)
    }
    
    func loadData() {
        if dataViewAdapter.viewModels.isEmpty {
            showSpinner()
        }
        
        interactor.fetchEntries()
    }
}

// MARK: - VIP cycle

extension ListEntriesViewController: ListEntriesDisplayable {
    
    func displayFetchedEntries(with viewModel: ListEntriesModels.ViewModel) {
        dataViewAdapter.reloadData(with: viewModel.entries)
        
        endRefreshing()
    }
}

extension ListEntriesViewController: EntriesDataViewDelegate {
    func entriesDataView(didSelect model: EntryDataViewModel, at indexPath: IndexPath, from dataView: DataViewable) {
        router.showEntry(id: model.id)
    }
    
    func entriesDataViewDidReloadData() {
        
    }
    
    func entriesDataViewWillBeginDragging(_ scrollView: UIScrollView) {
    }
    
    func entriesDataViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
    
}
