//
//  MessageTableViewCell.swift
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell, MessageCellConfiguration {
    @IBOutlet private var messageLabel: UILabel!
    var textMessage: String? {
        didSet {
            messageLabel.text = textMessage
            messageLabel.layer.cornerRadius = 5
            messageLabel.clipsToBounds = true
        }
    }

}
