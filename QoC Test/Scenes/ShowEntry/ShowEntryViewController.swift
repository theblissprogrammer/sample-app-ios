//
//  ShowEntryViewController.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import QocBusinessLogic

class ShowEntryViewController: UIViewController, HasDependencies {
    
    
    @IBOutlet weak var entryContainerStackView: UIStackView!
    @IBOutlet weak var entrySummaryView: EntrySummaryView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.refreshControl = UIRefreshControl().with {
                $0.addTarget(self, action: #selector(loadData), for: .valueChanged)
            }
        }
    }
    
    // MARK: - VIP variables
    
    lazy var interactor: ShowEntryBusinessLogic = ShowEntryInteractor(
        presenter: ShowEntryPresenter(viewController: self),
        entriesWorker: dependencies.resolveWorker()
    )
    
    // MARK: - View models
    
    private var viewModel: ShowEntryModels.ViewModel? {
        didSet { loadUI() }
    }
    
    // MARK: - Internal variables
    
    var entryID: Int! //Must assign or die
    
    // MARK: - Controller cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
    }
}

private extension ShowEntryViewController {
    
    func configure() {
    }
    
    
    @objc func loadData() {
        interactor.fetchEntry(
            with: ShowEntryModels.Request(entryID: entryID)
        )
    }
    
    func loadUI() {
        guard let viewModel = viewModel else { return }
        
        title = viewModel.name
        entrySummaryView.bind(viewModel)
    }
}

extension ShowEntryViewController: ShowEntryDisplayable {
    
    func displayFetchedEntry(with viewModel: ShowEntryModels.ViewModel) {
        self.viewModel = viewModel
    }
}
