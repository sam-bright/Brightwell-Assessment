//
//  StorageProtocol.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 6/10/22.
//

import Foundation

//protocol used by TransactionModelController to define if any storage module wants to iniciate TransactionModelController, they need to provide an storage solution which confirms to StorageProtocol
protocol StorageProtocol {
    func addTransaction(_ name: String)
    func getTransactions() -> [Transaction]
}
