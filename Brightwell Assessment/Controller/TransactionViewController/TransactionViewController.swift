//
//  ViewController.swift
//  Brightwell Assessment
//
//  Created by Sam Husain on 08/06/22.
//

import UIKit

class TransactionViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var transactionOrderingSegmentControl: TransactionOrderingSegmentControl!
    
    var transactions = [String]()
    var transactionModelController = TransactionModelController()
    
    var dataSource: TransactionViewControllerDataSource!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTransactions()
        setupTableViewDataSource()
        setUpTransactionOrderingSegmentControlDelegate()
    }
    
    private func updateTransactions() {
        let currentSegmentIndex = transactionOrderingSegmentControl.selectedSegmentIndex
        let currentOrdering = TransactionsListOrder.getOrdering(from: currentSegmentIndex)
        transactions = transactionModelController.getTransactions(by: currentOrdering)
    }
    
    private func setupTableViewDataSource() {
        dataSource = TransactionViewControllerDataSource(delegate: self)
        tableView.dataSource = dataSource
    }
    
    private func setUpTransactionOrderingSegmentControlDelegate() {
        transactionOrderingSegmentControl.delegate = self
        transactionOrderingSegmentControl.setUpTargetAction()
    }
    
    //MARK: Add Transaction Button
    @IBAction func addTransactionButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.Segues.goToAddTransactionViewController, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case K.Segues.goToAddTransactionViewController:
            guard let destinationVC = segue.destination as? UINavigationController else { return }
            guard let addTransactionVC = destinationVC.topViewController as? AddTransactionViewController else { return }
            addTransactionVC.delegate = self
        default:
            return
        }
    }
}

//MARK: Protocol Confirmation
extension TransactionViewController: TransactionViewControllerDataSourceDelegate {
}

extension TransactionViewController: TransactionOrderingSegmentControlDelegate {
    func orderingChanged(to order: TransactionsListOrder) {
        transactions = transactionModelController.getTransactions(by: order)
        tableView.reloadData()
    }
}

extension TransactionViewController: AddTransactionViewControllerDelegate {
    func transactionAdded(with name: String) {
        transactionModelController.addTransaction(name)
        updateTransactions()
        
        //I'm currently using tableView.reload() but it would be more user friendly (and efficient) if we can insert row at an given index so it is an area of improvment :)
        tableView.reloadData()
    }
}

//MARK: Table View Delegate
extension TransactionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
