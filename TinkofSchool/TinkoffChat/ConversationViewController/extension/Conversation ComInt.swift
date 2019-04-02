//
//  Conversation ComInt.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

extension ConversationViewController: CommunicationIntegrator {

    func updateUserData() {
        if !conversation.isOnline {
            sendButton.isEnabled = false
        }
        conversation.hasUnreadMessages = false
        scrollingToBottom()
    }
    func handleError(error: Error) {
        self.view.endEditing(true)
        let alert = UIAlertController(title: "Проблемы с соединением", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
