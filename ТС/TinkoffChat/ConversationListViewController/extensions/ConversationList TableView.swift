//
//  TableViewDataSource.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 07/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

extension ConversationListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversationCell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath) as! ConversationTableViewCell
        let conversation = conversations[indexPath.row]
        conversationCell.name = conversation.name
        conversationCell.message = conversation.message
        conversationCell.date = conversation.date
        conversationCell.hasUnreadMessages = conversation.hasUnreadMessages
        conversationCell.online = conversation.online
        return conversationCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Online"
        default:
            return "History"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ConversationSegue", sender: indexPath)
    }
}
