//
//  AdditionalObject.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 11/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

protocol ConversationCellConfiguration {
    
    var name: String? {get set}
    var message: String? {get set}
    var date: Date? {get set}
    var online: Bool {get set}
    var hasUnreadMessage: Bool {get set}
}

protocol MessageCellConfiguration {
    var text: String? {get set}
}

struct ConversationList: ConversationCellConfiguration {
    var name: String?
    var message: String?
    var date: Date?
    var online: Bool
    var hasUnreadMessage: Bool
}


struct MessageLists: MessageCellConfiguration {
    var text: String?
}


protocol SaveDataProtocol {
    var saveData: Bool {get set}
    var savePhoto: Bool {get set}
    var saveProfileName: Bool {get set}
    var saveAbout: Bool {get set}
    var textAlert: String? {get}
}

struct SaveData: SaveDataProtocol {
    
    var saveData: Bool = false
    var savePhoto: Bool = false
    var saveProfileName: Bool = false
    var saveAbout: Bool = false
    var textAlert: String?
    
    mutating func textAlertFunc() -> String {
        return self.saveData == true ?  "Данные сохранены" : "Данные не удалось записать"
    }
}



