//
//  TransactionOrderingSegmentControl.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 09/06/22.
//

import UIKit

class TransactionOrderingSegmentControl: UISegmentedControl {
    
    weak var delegate: TransactionOrderingSegmentControlDelegate?
    
    //I kept running into issues when trying to create custom designated intializers so I'm using seperate function for target action setup for now, but in future, we should consider removing this technical debt after doing some more research so our tests can be further refactored
    func setUpTargetAction() {
        addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
    }
    
    @objc func segmentedValueChanged() {
        let order = TransactionsListOrder.getOrdering(from: selectedSegmentIndex)
        delegate?.orderingChanged(to: order)
    }
}

protocol TransactionOrderingSegmentControlDelegate: AnyObject {
    func orderingChanged(to order: TransactionsListOrder)
}
