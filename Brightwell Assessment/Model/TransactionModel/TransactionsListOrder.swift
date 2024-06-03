//
//  TransactionsListOrder.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 08/06/22.
//

import Foundation

enum TransactionsListOrder: Int {
    case alphabetical
    case creationTime
    
    static func getOrdering(from index: Int) -> TransactionsListOrder {
        return TransactionsListOrder.init(rawValue: index) ?? .alphabetical
    }
}
