//
//  StorageManager.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 25/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation


class StorageManager {
    private let coreDataStack = CoreDataStack.shared
    
    func loadAppUser(completion: @escaping (AppUser?) -> Void) {
        AppUser.getAppUser(in: coreDataStack.saveContext) { (appUser) in
            DispatchQueue.main.async {
                completion(appUser)
            }
        }
    }
    
    func saveAppUser(completion: @escaping CompletionSaveHandler) {
        coreDataStack.performSave(in: coreDataStack.saveContext) { (error) in
            DispatchQueue.main.async {
                completion(error)
            }
        }
    }
}
