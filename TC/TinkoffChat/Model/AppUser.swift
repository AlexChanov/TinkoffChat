//
//  AppUser.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 25/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation
extension AppUser {
    static func getRequest(model: NSManagedObjectModel) -> NSFetchRequest<AppUser>? {
        let template = "FetchRequestAppUser"
        guard let request = model.fetchRequestTemplate(forName: template) as? NSFetchRequest<AppUser> else {
            assert(false, "No template with typename \(template)")
            return nil }
        return request
    }
    
    static func insertAppUser(in context: NSManagedObjectContext) -> AppUser? {
        guard let appUser = NSEntityDescription.insertNewObject(forEntityName: "AppUser", into: context) as? AppUser else {
            return nil
        }
        appUser.name = UIDevice.current.name
        appUser.userImageData = UIImage(named: "placeholder-user")!.jpegData(compressionQuality: 1.0)
        appUser.descriptionUser = ""
        return appUser
}

