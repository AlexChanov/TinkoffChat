//
//  Saver.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

typealias CompletionSaveHandler = (Error?) -> Void
typealias CompletionProfileLoader = (Profile) -> Void

protocol DataManager {
    func getProfile(completion: @escaping CompletionProfileLoader)
    func saveProfile(profile: AppUser, newName: String, newDescription: String, newImageData: Data, completion: @escaping CompletionSaveHandler)
}

enum ImageError: Error {
    case convertDataError
}
