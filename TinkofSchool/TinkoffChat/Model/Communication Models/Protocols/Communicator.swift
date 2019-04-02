//
//  Communicator.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

typealias MessageHandler = (_ succes: Bool, _ error: Error?) -> Void

protocol Communicator {
    func sendMessage(string: String, to userId: String, completionHandler: MessageHandler?)
    var delegate: CommunicatorDelegate? {get set}
    var online: Bool {get set}
}
