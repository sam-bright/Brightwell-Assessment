//
//  AddTransactionViewController.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 10/06/22.
//

import UIKit

protocol AddTransactionViewControllerDelegate: AnyObject {
    func transactionAdded(with name: String)
}

class AddTransactionViewController: UIViewController {
    @IBOutlet weak var transactionNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    weak var delegate: AddTransactionViewControllerDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        transactionNameTextField.becomeFirstResponder()
    }
    
    @IBAction func transactionNameTextFieldEditingChanged(_ sender: UITextField) {
        let currentText = transactionNameTextField.text
        saveButton.isEnabled = AddTransactionLogicController.shouldEnableSaveButton(currentText)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        guard let transactionName = transactionNameTextField.text else { return }
        delegate?.transactionAdded(with: transactionName)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
