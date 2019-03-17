//
//  CommunicationIntegrate.swift
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов] Алексей . All rights reserved.
//

protocol CommunicationIntegrate : class {
    func updateUserData()
    func handleError(error: Error)
}
