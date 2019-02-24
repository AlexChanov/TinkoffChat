//
//  ConversationModel.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 24/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

struct ConversationModel {
    
    static private var userID : IndexPath?
    
    // getter для модели чата
    static func getChatModel() -> ListTableViewCellProtocol? { // это пример. Нужна отдельная модель для экрана чата
        guard let indexPath = userID else { return nil }
        
        if indexPath.section == 0 {
            return MainAppModel.onlineСellDataPrototyps[indexPath.row]
        } else {
            return MainAppModel.offlineСellDataPrototyps[indexPath.row]
        }
    }
    // setter для модели индентификатора модели чата
    static func setChatId(_ indexPath: IndexPath) {
        
        userID = indexPath
    }
    
    let messageArray: [ConversationCellModel] = [ConversationCellModel(text: "Привет как дела?"),
                                                 ConversationCellModel(text: "Замечательно как и этот вечер"),
                                                 ConversationCellModel(text: "Даа солнце светит"),
                                                 ConversationCellModel(text: "И ветер дует"),
                                                 ConversationCellModel(text: "Рассказать стих?"),
                                                 ConversationCellModel(text: "Нет"),
                                                 ConversationCellModel(text: "Я вас любил: любовь еще, быть может,в душе моей угасла не совсем, но пусть она вас больше не тревожит...")]
}
