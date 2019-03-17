//
//  Saver.swift
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов Алексей . All rights reserved.
//

import Foundation

typealias CompletionSaveHandler = (Error?) -> Void
typealias CompletionProfileLoader = (Profile) -> Void

protocol DataManager {
    func getProfile(completion: @escaping CompletionProfileLoader)
    func saveProfile(newProfile: Profile, oldProfile: Profile, completion: @escaping CompletionSaveHandler)
}

enum ImageError: Error {
    case convertDataError
}
