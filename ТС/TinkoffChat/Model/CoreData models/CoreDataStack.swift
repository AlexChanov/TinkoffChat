//
//  CoreDataStack.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    private init() {}
    
    private lazy var storeURL: URL = {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let docUrl = url.appendingPathComponent("DataModel.sqlite")
        return docUrl
    }()
    
    
    lazy var saveContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = mainContext
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        context.undoManager = nil
        return context
    }()
    
    
    lazy var masterContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentCoordinator
        context.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        context.undoManager = nil
        return context
    }()
    
    func performSave(in context: NSManagedObjectContext, completion: CompletionSaveHandler?) {
        if context.hasChanges {
            context.perform {
                do {
                    try context.save()
                } catch {
                    completion?(error)
                }
                if let parentContext = context.parent {
                    self.performSave(in: parentContext, completion: completion)
                } else {
                    completion?(nil)
                }
            }
        } else {
            completion?(nil)
        }
    }
    
}
