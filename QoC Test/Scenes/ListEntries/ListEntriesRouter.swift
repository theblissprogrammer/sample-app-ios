//
//  ListEntriesRouter.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//

import UIKit

struct ListEntriesRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension ListEntriesRouter: ListEntriesRoutable {
    
    func showEntry(id: String) {
        /*show(storyboard: .showCreditCard) { (controller: ShowCreditCardViewController) in
            controller.creditCardID = id
        }*/
    }
}

