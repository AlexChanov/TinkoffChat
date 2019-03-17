//
//  CommunicatorDelegate.swift
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов Алексей . All rights reserved.
//

protocol CommunicatorDelegate : class {
    //discovering
    func didFoundUser(userId: String, userName: String?)
    func didLostUser(userId: String)
    
    //errors
    func failedToStartBrowsingForUsers(error: Error)
    func failedToStartAdvertising(error: Error)
    
    //messages
    func didReceiveMessage(text: String, fromUser: String, toUser: String)
}
