//
//  MessageTableViewCell.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 07/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
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
