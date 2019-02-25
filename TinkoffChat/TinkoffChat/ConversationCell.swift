//
//  ConversationCell.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 24/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {
    
    @IBOutlet weak var incomingMessageLabel: UILabel!
    
    @IBOutlet weak var outgoingMessageLabel: UILabel!
    
    var dataInputMessage : MessageCellCongiguration! {
        didSet {
            incomingMessageLabel.text = dataInputMessage.text
            settingLabel(incomingMessageLabel)
        }
    }
    
    var dataOutMessage : MessageCellCongiguration! {
        didSet {
            outgoingMessageLabel.text = dataOutMessage.text
            settingLabel(outgoingMessageLabel)
        }
    }
    
    func settingLabel(_ label: UILabel){
        
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = label.frame.height/2
    }
    
}
