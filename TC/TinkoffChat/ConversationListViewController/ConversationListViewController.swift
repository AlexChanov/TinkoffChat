//
//  ConversationListViewController.swift
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов Алексей . All rights reserved.
//

import UIKit

class ConversationListViewController: UIViewController, CommunicationIntegrate {
    func updateUserData() {
        conversations = Array(CommunicationManager.shared.conversationHolder.values)
        distributionConversations()
        tableView.reloadData()
    }
    
    func handleError(error: Error) {
        print("error")
    }
    
    @IBOutlet private var tableView: UITableView!
    var conversations: [Conversation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distributionConversations()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CommunicationManager.shared.delegate = self
        updateUserData()
    }
    private func distributionConversations() {
        conversations.sort(by: sortConversation(firstConversation:secondConversation:))
    }

    private func sortConversation(firstConversation: Conversation, secondConversation: Conversation) -> Bool {
        if let firstDate = firstConversation.date, let firstName = firstConversation.name {
            if let secondDate = secondConversation.date, let secondName = firstConversation.name {
                if firstDate.timeIntervalSinceNow != secondDate.timeIntervalSinceNow {
                    return firstDate.timeIntervalSinceNow > secondDate.timeIntervalSinceNow
                }
                return firstName > secondName
            }
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConversationSegue", let indexPath = sender as? IndexPath {
            let conversationViewController = segue.destination as! ConversationViewController
            let conversation: Conversation
            conversation = conversations[indexPath.row]
            conversationViewController.conversation = conversation
            
            let backButton = UIBarButtonItem()
            backButton.title = "Назад"
            navigationItem.backBarButtonItem = backButton
        } else if segue.identifier == "ThemesSegue" {
            guard let themesNVC = segue.destination as? UINavigationController, let themesVC = themesNVC.viewControllers.first as? ThemesViewController else { return }
            themesVC.delegate = self
      
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }

    @IBAction func unwindToConversationList(unwindSegue: UIStoryboardSegue) {
        
    }
    
}
