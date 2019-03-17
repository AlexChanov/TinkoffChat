//
//  Communicator.swift
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов] Алексей . All rights reserved.
//

typealias MessageHandler = (_ succes: Bool, _ error: Error?) -> ()

protocol Communicator {
    func sendMessage(string: String, to userId: String, completionHandler: MessageHandler?)
    var delegate: CommunicatorDelegate? {get set}
    var online: Bool {get set}
  
}
