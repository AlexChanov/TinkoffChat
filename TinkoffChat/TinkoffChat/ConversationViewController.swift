//
//  ConversationViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 22/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {
    
    @IBOutlet weak var namePersonLabel: UILabel!
    @IBOutlet weak var conversationTableView: UITableView!
    
    var nameFriend : String?
    let conversationModel = ConversationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameFriend = ConversationModel.getChatModel()?.name
        self.namePersonLabel.text = self.nameFriend
        conversationTableView.delegate = self
        conversationTableView.dataSource = self
    }
}

extension ConversationViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  conversationModel.messageArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item % 2 == 0 {
            
            if let inputCell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as? ConversationCell
            {
                inputCell.dataInputMessage = conversationModel.messageArray[indexPath.row]
                return inputCell
            }
        } else {
            if let outgoingCell = tableView.dequeueReusableCell(withIdentifier: "outgoingCell", for: indexPath) as? ConversationCell
            {
                outgoingCell.dataOutMessage = conversationModel.messageArray[indexPath.row]
                return outgoingCell
            }
        }
        return UITableViewCell()
    }
    
}
