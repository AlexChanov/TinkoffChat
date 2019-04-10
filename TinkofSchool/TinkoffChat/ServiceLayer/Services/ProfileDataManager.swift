//
//  Saver.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

typealias CompletionSaveHandler = (Error?) -> Void
typealias CompletionProfileLoader = (IProfile) -> Void

protocol ProfileDataManager {
    func getProfile(completion: @escaping CompletionProfileLoader)
    func saveProfile(newProfile: IProfile, oldProfile: IProfile, completion: @escaping CompletionSaveHandler)
}

enum SaveErrors: Error {
    case convertDataError
    case loadDataError
}
