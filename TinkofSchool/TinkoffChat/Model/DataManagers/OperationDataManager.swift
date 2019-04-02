//
//  OperationDataManager.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

struct OperationDataManager: DataManager {
    var documentsDirectory: URL
    var archiveURL: URL
    let operationQueue = OperationQueue()

   
    func saveProfile(newProfile: Profile, oldProfile: Profile, completion: @escaping CompletionSaveHandler) {
        let saveOperation = SaveProfileOperation()
        saveOperation.archiveURL = archiveURL
        saveOperation.completionHandler = completion
        saveOperation.newProfile = newProfile
        saveOperation.oldProfile = oldProfile
        operationQueue.addOperation(saveOperation)
    }

    func getProfile(completion: @escaping CompletionProfileLoader) {
        let loadOperation = ProfileLoadingOperation()
        loadOperation.archiveURL = archiveURL
        loadOperation.completionHandler = completion
        operationQueue.addOperation(loadOperation)
    }
}

class ProfileLoadingOperation: Operation {
    var profile: Profile!
    var archiveURL: URL!
    var completionHandler: CompletionProfileLoader!

    override func main() {
        let name = UserDefaults.standard.string(forKey: "user_name") ?? "Без имени"
        let description = UserDefaults.standard.string(forKey: "user_description") ?? ""
        let imageData: Data = (try? Data(contentsOf: archiveURL))
            ?? UIImage(named: "placeholder-user")!.jpegData(compressionQuality: 1.0)!
        profile = Profile(name: name, description: description, userImageData: imageData)
        OperationQueue.main.addOperation { self.completionHandler(self.profile) }
    }
}

class SaveProfileOperation: Operation {
    var newProfile: Profile!
    var oldProfile: Profile!
    var completionHandler: CompletionSaveHandler!
    var archiveURL: URL!

    override func main() {
        if newProfile.name != oldProfile.name {
            UserDefaults.standard.set(newProfile.name, forKey: "user_name")
        }
        if newProfile.description != oldProfile.name {
            UserDefaults.standard.set(newProfile.description, forKey: "user_description")
        }
        if newProfile.userImageData
            != oldProfile.userImageData {
            do {
                try newProfile.userImageData.write(to: archiveURL, options: .noFileProtection)
            } catch let error {
                self.completionHandler(error)
            }
        }
        OperationQueue.main.addOperation {
            self.completionHandler(nil)
        }
    }
}