//
//  ICommunicationManager.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 15/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

protocol CommunicatorDelegate: class {
    
    //discovering
    func didFoundUser(userId: String, userName: String?)
    func didLostUser(userId: String)
    
    //errors
    func failedToStartBrowsingForUsers(error: Error)
    func failedToStartAdvertising(error: Error)
    
    //messages
    func didReceiveMessage(text: String, fromUser: String, toUser: String)
  
}

