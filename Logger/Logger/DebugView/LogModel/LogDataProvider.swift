//
//  LogDataProvider.swift
//  Logger
//
//  Created by Okan Sarp Kaya on 30.12.2022.
//

import Foundation
import CoreData
import UIKit

class LogDataProvider {
    private(set) var managedObjectContext: NSManagedObjectContext
    private weak var fetchedResultsControllerDelegate: NSFetchedResultsControllerDelegate?

    init(with managedObjectContext: NSManagedObjectContext,
         fetchedResultsControllerDelegate: NSFetchedResultsControllerDelegate?)
    {
        self.managedObjectContext = managedObjectContext
        self.fetchedResultsControllerDelegate = fetchedResultsControllerDelegate
    }

    /**
     A fetched results controller for the NewsPosts entity, sorted by date.
     */
    lazy var fetchedResultsController: NSFetchedResultsController<LogEntity> = {
        let fetchRequest: NSFetchRequest<LogEntity> = LogEntity.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(LogEntity.date), ascending: false)]

        let controller = NSFetchedResultsController(
            fetchRequest: fetchRequest, managedObjectContext: managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        controller.delegate = fetchedResultsControllerDelegate

        do {
            try controller.performFetch()
        } catch {
            print("Fetch failed")
        }

        return controller
    }()
}
