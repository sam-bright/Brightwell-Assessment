//
//  AddTransactionLogicController.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 10/06/22.
//

import Foundation

//Logic controllers holds the business logic of view controller.
//Inspiration: https://www.youtube.com/watch?v=Ni70aTksJWg

struct AddTransactionLogicController {
    
    //To provide a better UX, save button is disabled till user enter some text field
    static func shouldEnableSaveButton(_ currentText: String?) -> Bool {
        guard let text = currentText else { return false }
        return text.count > 0
    }
}
