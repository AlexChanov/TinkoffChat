//
//  TableViewDataSource.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

extension ConversationListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchResultController.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchResultController.sections else { return 0 }
        return sections[section].numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let conversationCell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell",
                                                                   for: indexPath) as? ConversationTableViewCell else {
                                                                    return UITableViewCell() }
        let conversation = fetchResultController.object(at: indexPath)
        conversationCell.name = conversation.user?.name
        conversationCell.message = conversation.lastMessage?.text
        conversationCell.date = conversation.date
        conversationCell.hasUnreadMessages = conversation.hasUnreadMessages
        conversationCell.online = conversation.isOnline
        return conversationCell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = fetchResultController.sections else { return nil }
        return sections[section].name == "1" ? "Online" : "History"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ConversationSegue", sender: indexPath)
    }
}
