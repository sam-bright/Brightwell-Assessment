//
//  TransactionModelController.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 08/06/22.
//

import Foundation

//Inspiration: https://www.swiftbysundell.com/articles/model-controllers-in-swift/
class TransactionModelController {
    
    var storage: StorageProtocol
    
    //used dependency injection below to get modularity and easy mocking testing
    init(storage: StorageProtocol = PersistenceStorage()){
        self.storage = storage
    }
    
    var totalTransactions: Int {
        return storage.getTransactions().count
    }
    
    func addTransaction(_ transactionName: String){
        storage.addTransaction(transactionName)
    }
    
    func getTransactions(by order: TransactionsListOrder = .alphabetical) -> [String] {
        let transactions = storage.getTransactions()
        return transactions
            .sorted {
                switch order {
                case .creationTime:
                    return $0.creationTime > $0.creationTime //decending order: latest transactions first
                case .alphabetical:
                    return $0.name.lowercased() < $1.name.lowercased() //ascending order
                }
            }
            .map {
                $0.name
            }
    }
}
