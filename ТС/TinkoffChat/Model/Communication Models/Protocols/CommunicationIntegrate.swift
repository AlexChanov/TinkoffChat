//
//  CommunicationIntegrate.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

protocol CommunicationIntegrate : class {
    func updateUserData()
    func handleError(error: Error)
}
