//
//  AppButton.swift
//
//  Created by Ahmed Saad on 2018-07-26.
//

import UIKit

class AppButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // TODO: Implement enum styles
        borderColor = .tint
        borderWidth = 1
        cornerRadius = 3
    }
}
