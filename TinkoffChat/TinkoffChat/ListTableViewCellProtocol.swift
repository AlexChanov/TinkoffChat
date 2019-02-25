//
//  ListTableViewCellProtocol.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 23/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

protocol ListTableViewCellProtocol : class {
    
    var name : String? {get set}
    var message : String? {get set}
    var date : Date? {get set}
    var online : Bool {get set}
    var hasUnreadMessage : Bool { get set}
}
