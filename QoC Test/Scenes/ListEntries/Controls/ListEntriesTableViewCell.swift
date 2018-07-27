//
//  ListEntriesTableViewCell.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit
import ZamzamKit

class ListEntriesTableViewCell: UITableViewCell, EntriesDataViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var featuredImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
        
        containerView.backgroundColor = .black
        titleLabel.textColor = .white
        featuredImage.cornerRadius = 10
    }
}

extension ListEntriesTableViewCell {
    
    func bind(_ model: EntryDataViewModel) {
        titleLabel.text = model.title
        featuredImage.setURL(model.imageURL)
    }
}
