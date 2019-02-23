//
//  ListTableViewCell.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 22/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!


    var dataModel : ListTableViewCellProtocol! {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        nameLabel.text = dataModel.name
        
        if let text = dataModel.message {
            messageLabel.text = text
        } else {
            messageLabel.text = "No message yet"
        }
        if let date = dataModel.date {
            dateLabel.text = date.stringForCell()
        }
        
        if dataModel.online {
            self.backgroundColor = UIColor(displayP3Red: 255.0/255.0, green: 254.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        } else {
            self.backgroundColor = UIColor.white
        }
        
        if dataModel.hasUnreadMessage {
            messageLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 17.0)
        } else {
            messageLabel.font = UIFont(name:"HelveticaNeue", size: 17.0)
        }
    }
}
