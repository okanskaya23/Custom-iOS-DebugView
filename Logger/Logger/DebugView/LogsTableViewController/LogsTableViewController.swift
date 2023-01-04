//
//  LogsTableViewController.swift
//  Debug
//
//  Created by Okan Sarp Kaya on 26.12.2022.
//

import Foundation
import UIKit
import CoreData

class LogsViewController: UIViewController, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    private var dataSource: UITableViewDiffableDataSource<LogsViewController.Section, LogEntity>?
    var fetchedResultsController: NSFetchedResultsController<LogEntity>!

    private let logTableView = LogTableView()
    private let viewModel = LogsViewModel()
    
    private enum Section {
      case main
    }

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureDataSource()
        self.configureTableView()
        self.initFetchedResultsController()
        
        
        MockLogData.generateMockLogs()
    }
    
    override func loadView() {
        view = logTableView
    }
}

//MARK: TableView
extension LogsViewController {
    private func configureDataSource() {
        logTableView.tableView.delegate = self
        dataSource = UITableViewDiffableDataSource<LogsViewController.Section, LogEntity>(tableView: logTableView.tableView, cellProvider: { (tableView, indexPath, value) -> LogTableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: LogTableViewCell.reuseIdentifier, for: indexPath) as? LogTableViewCell
            cell?.configure(with: .init(model: value))
            return cell
        })
        dataSource?.defaultRowAnimation = .fade
    }
    
    private func configureTableView(){
        logTableView.tableView.register(LogTableViewCell.self, forCellReuseIdentifier: LogTableViewCell.reuseIdentifier)
    }
}

//MARK: TableViewData
extension LogsViewController{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChangeContentWith snapshot: NSDiffableDataSourceSnapshotReference) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, LogEntity>()
        snapshot.appendSections([.main])
        snapshot.appendItems(fetchedResultsController.fetchedObjects ?? [])
        self.dataSource?.apply(snapshot, animatingDifferences: view.window != nil)
    }

    
    func initFetchedResultsController() {
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: LogEntity.fetchRequest(), managedObjectContext: self.viewModel.managedContext, sectionNameKeyPath: nil, cacheName: nil)
        self.fetchedResultsController.delegate = self
        try! self.fetchedResultsController.performFetch()
    }

}

