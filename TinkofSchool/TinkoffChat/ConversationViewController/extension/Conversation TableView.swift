//
//  TableViewDataSource.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

extension ConversationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchResultController.sections else { return 0 }
        return sections[section].numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = fetchResultController.object(at: indexPath)
        if message.isIncoming {
            guard let messageCell = tableView.dequeueReusableCell(withIdentifier: "MessageIncomingCell",
                                                                  for: indexPath) as? MessageTableViewCell else {
                                                                    return UITableViewCell() }
            messageCell.textMessage = message.text
            return messageCell
        } else {
            guard let messageCell = tableView.dequeueReusableCell(withIdentifier: "MessageOutgoingCell",
                                                                  for: indexPath) as? MessageTableViewCell else {
                                                                    return UITableViewCell() }
            messageCell.textMessage = message.text
            return messageCell
        }
    }
}
