//
//  Communicator.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

typealias MessageHandler = (_ succes: Bool, _ error: Error?) -> Void

protocol Communicator {
    func sendMessage(text: String, to userId: String, completionHandler: MessageHandler?)
    func startCommunication(name: String)
    var delegate: ICommunicationManager? {get set}
    var online: Bool {get set}
}
