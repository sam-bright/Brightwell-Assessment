//
//  Constants.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 08/06/22.
//

import UIKit

enum K {
    enum Storyboard {
        private static let bundle = Bundle(identifier: "com.craftedthoughts.Brightwell-Assessment")
        
        static var transactionStoryboard: UIStoryboard {
            let storyboard = UIStoryboard(name: "Transaction", bundle: K.Storyboard.bundle)
            return storyboard
        }
        
        static var addTransactionStoryboard: UIStoryboard {
            let storyboard = UIStoryboard(name: "AddTransaction", bundle: K.Storyboard.bundle)
            return storyboard
        }
    }
    
    enum Identifiers {
        static let transactionTableViewCell = "TransactionTableViewCell"
        static let transactionViewController = "TransactionViewController"
        static let addTransactionViewController = "AddTransactionViewController"
    }
    
    enum Segues {
        static let goToAddTransactionViewController = "GoToAddTransactionViewController"
    }
    
    enum SampleData {
        static let transactions = ["Jeans", "Shirt", "Pant","Tshirt","Dress"]
        static let transactionsSortedAlphabetically = ["Dress","Jeans","Pant", "Shirt","Tshirt"]
    }
    
    enum DataModel {
        static let transactionDataModel = "TransactionDataModel"
    }
}
