//
//  LogDataInterface.swift
//  Debug
//
//  Created by Okan Sarp Kaya on 28.12.2022.
//

import Foundation
import Combine
import CoreData
import UIKit

public class LogDataInterface{
    
    public init(){
        
    }
    private static var savedArray = [LogEntity]()


    func getLogList() -> [LogEntity]{
        return LogDataInterface.savedArray
    }
    
    public static  func addLog(logModel: LogModel){
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let newNote = LogEntity(context: managedContext)
        newNote.setValue(logModel.name, forKey: #keyPath(LogEntity.logMessage))
        newNote.setValue(logModel.id, forKey: #keyPath(LogEntity.uuid))
        newNote.setValue(logModel.type, forKey: #keyPath(LogEntity.type))
        newNote.setValue(Date.now, forKey: #keyPath(LogEntity.date))
        self.savedArray.insert(newNote, at: 0)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        
    }
    
}
