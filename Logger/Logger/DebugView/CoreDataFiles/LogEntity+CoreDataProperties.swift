//
//  LogEntity+CoreDataProperties.swift
//  Logger
//
//  Created by Okan Sarp Kaya on 30.12.2022.
//
//

import Foundation
import CoreData


extension LogEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LogEntity> {
        let fr =  NSFetchRequest<LogEntity>(entityName: "LogEntity")
        let sort = NSSortDescriptor(key: #keyPath(LogEntity.date),
                                    ascending: false)
        fr.sortDescriptors = [sort]
        return fr
    }

    @NSManaged public var type: Int16
    @NSManaged public var uuid: UUID?
    @NSManaged public var date: Date
    @NSManaged public var logMessage: String?

}

extension LogEntity : Identifiable {

}
