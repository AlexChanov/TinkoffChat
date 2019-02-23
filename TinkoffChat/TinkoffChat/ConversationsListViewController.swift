//
//  ConversationsListViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 22/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

class ConversationsListViewController: UIViewController {

    @IBAction func profileImage(_ sender: Any) {
    performSegue(withIdentifier: "profileSegue", sender: self)
    }
    @IBOutlet weak var tableView: UITableView!
    
    let cellNIB = UINib(nibName: "ListTableViewCell", bundle: nil)
    let kcellidentifier = "ListTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellNIB, forCellReuseIdentifier: kcellidentifier)
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    

  
}

extension ConversationsListViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Online"
        case 1:
            return "History"
        default:
            return "Error with section header"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "chatScreenSegue", sender: self)
    }
    
}
