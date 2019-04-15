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

