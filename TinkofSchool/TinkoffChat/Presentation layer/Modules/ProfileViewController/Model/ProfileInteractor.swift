//
//  ProfileInteractor.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol IProfileInteractor {
    var profile: IProfile! { get set }
    var profileDataManager: ProfileDataManager { get set }
    func loadProfile(completion: @escaping () -> Void)
    func saveProfile(name: String, description: String, imageData: Data, completion: @escaping CompletionSaveHandler)
    var name: String { get }
    var description: String { get }
    var imageData: Data { get }
}

class ProfileInteractor: IProfileInteractor {
    var description: String {
        return profile.description
    }

    var name: String {
        return profile.name
    }

    var imageData: Data {
        return profile.userImageData
    }

    var profile: IProfile!

    var profileDataManager: ProfileDataManager

    init(profileDataManager: ProfileDataManager) {
        self.profileDataManager = profileDataManager
    }

    func loadProfile(completion: @escaping () -> Void) {
        profileDataManager.getProfile { (profile) in
            self.profile = profile
            completion()
        }
    }

    func saveProfile(name: String, description: String, imageData: Data, completion: @escaping CompletionSaveHandler) {
        let newProfile = Profile(name: name, description: description, userImageData: imageData)
        profileDataManager.saveProfile(newProfile: newProfile, oldProfile: profile) { (error) in
            if error == nil {
                self.profile = newProfile
            }
            completion(error)
        }
    }

}
