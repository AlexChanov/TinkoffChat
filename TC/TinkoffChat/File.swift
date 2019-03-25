//
//  File.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation
import CoreData

class AppUser  {
    
    var storeUrl : URL {
        let documentsUtl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsUtl.appendingPathComponent("MyStore.sqlite")
    }
    
    let dataModelName = "MyDataModel"
    let dataModelExtension = "momd"
    
    lazy var managedObjectModel : NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: self.dataModelName, withExtension: self.dataModelExtension)!
        
        return NSManagedObjectModel(contentsOf: modelURL)! 
    }()
    
    
}
