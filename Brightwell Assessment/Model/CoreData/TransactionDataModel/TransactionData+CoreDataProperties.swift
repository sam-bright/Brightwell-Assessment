//
//  TransactionData+CoreDataProperties.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 6/10/22.
//
//

import Foundation
import CoreData


extension TransactionData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionData> {
        return NSFetchRequest<TransactionData>(entityName: "TransactionData")
    }

    @NSManaged public var name: String?
    @NSManaged public var creationTime: Date?

}

extension TransactionData : Identifiable {

}
