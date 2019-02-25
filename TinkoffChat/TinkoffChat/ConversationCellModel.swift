//
//  ConversationCellModel.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 24/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

class ConversationCellModel: MessageCellCongiguration {
    
    var text: String?

    init(text : String) {
        self.text = text
    }
    
}
