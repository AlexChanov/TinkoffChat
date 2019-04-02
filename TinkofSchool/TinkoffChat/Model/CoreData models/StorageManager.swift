//
//  StorageManager.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

class StorageManager: DataManager {

    private let coreDataStack = CoreDataStack.shared

    func getProfile(completion: @escaping CompletionProfileLoader) {
        AppUser.getAppUser(in: coreDataStack.saveContext) { (appUser) in
            let profile: Profile
            if let appUser = appUser {
                let name = appUser.currentUser?.name ?? UIDevice.current.name
                let descritption = appUser.descriptionUser ?? ""
                let imageData = appUser.userImageData ??
                    UIImage(named: "placeholder-user")!.jpegData(compressionQuality: 1.0)
                profile = Profile(name: name, description: descritption, userImageData: imageData!)
                DispatchQueue.main.async {
                    completion(profile)
                }
            } else {
                assert(false, "AppUser is nil")
            }
        }
    }

    func saveProfile(newProfile: Profile, oldProfile: Profile, completion: @escaping CompletionSaveHandler) {
        AppUser.getAppUser(in: coreDataStack.saveContext) { (appUser) in
            guard let appUser = appUser else {
                DispatchQueue.main.async {
                    completion(SaveErrors.loadDataError)
                }
                return
            }
            if newProfile.name != oldProfile.name {
                appUser.currentUser?.name = newProfile.name
            }
            if newProfile.description != oldProfile.description {
                appUser.descriptionUser = newProfile.description
            }
            if newProfile.userImageData
                != oldProfile.userImageData {
                appUser.userImageData = newProfile.userImageData
            }
            self.coreDataStack.performSave(in: self.coreDataStack.saveContext) { (error) in
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }
}
