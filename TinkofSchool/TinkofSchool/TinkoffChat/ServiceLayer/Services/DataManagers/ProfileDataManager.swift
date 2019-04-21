//
//  Saver.swift
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
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
