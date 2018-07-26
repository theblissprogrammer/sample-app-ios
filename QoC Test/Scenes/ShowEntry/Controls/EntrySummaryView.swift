//
//  EntrySummaryView.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import ZamzamKit

class EntrySummaryView: XIBView {
    
    // MARK: - Controls
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UITextView!
    @IBOutlet weak var releaseDateLabel: UITextView!
    @IBOutlet weak var summaryLabel: UITextView!
    @IBOutlet weak var priceLabel: UITextView!
    @IBOutlet weak var categoryLabel: UITextView!
    @IBOutlet weak var publisherLabel: UITextView!
    @IBOutlet weak var appStoreLabel: UITextView!
    
    
    // MARK: - Controller cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //addCardShadow()
    }
}

// MARK: - Public API's

extension EntrySummaryView {
    
    func bind(_ viewModel: ShowEntryModels.ViewModel) {
        iconImageView.setURL(viewModel.iconUrl)
        titleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        summaryLabel.text = viewModel.summary
        priceLabel.text = viewModel.price
        categoryLabel.text = viewModel.category
        publisherLabel.text = viewModel.publisherName + " " + viewModel.publisherLink
        appStoreLabel.text = viewModel.link
    }
}
