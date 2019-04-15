//
//  CoreDataStack.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Алексей. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataStack {
    func performSave(in context: NSManagedObjectContext, completion: CompletionSaveHandler?)
    var mainContext: NSManagedObjectContext { get }
    var saveContext: NSManagedObjectContext { get }
}

class NestedWorkersCoreDataStack: CoreDataStack {
    static let shared = NestedWorkersCoreDataStack()
    private init() {}

    private lazy var storeURL: URL = {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let docUrl = url.appendingPathComponent("DataModel.sqlite")
        return docUrl
    }()

    lazy var objectModel: NSManagedObjectModel = {
        guard let mom = Bundle.main.url(forResource: "DataModel",
                                        withExtension: "momd") else { fatalError("Can't search the resource") }
        guard let objectModel = NSManagedObjectModel(contentsOf: mom)
            else { fatalError("Can't search the object model by this url: \(mom)") }
        return objectModel
    }()

    private lazy var persistentCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: objectModel)
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                               configurationName: nil, at: storeURL, options: nil)
        } catch let error {
            assertionFailure("Error due try to add store at \(storeURL) with description \(error.localizedDescription)")
        }
        return coordinator
    }()

    
    lazy var masterContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentCoordinator
        context.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        context.undoManager = nil
        return context
    }()

    func performSave(in context: NSManagedObjectContext, completion: CompletionSaveHandler?) {
        context.perform {
            if context.hasChanges {
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
            } else {
                completion?(nil)
            }
        }
    }
}
