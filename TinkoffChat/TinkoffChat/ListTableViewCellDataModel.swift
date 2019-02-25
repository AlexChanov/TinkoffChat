//
//  ListTableViewCellDataModel.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 23/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

class ListTableViewCellDataModel: ListTableViewCellProtocol{
    
    var name: String?
    var message: String?
    var date: Date?
    var online: Bool
    var hasUnreadMessage: Bool
    
    init(name: String?,
         message: String?,
         date: Date?,
         online: Bool,
         hasUnreadMessage: Bool) {
        
        self.name = name
        self.message = message
        self.date = date
        self.online = online
        self.hasUnreadMessage = hasUnreadMessage
    }
}
