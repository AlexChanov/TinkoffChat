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
    let kCellidentifier = "ListTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellNIB, forCellReuseIdentifier: kCellidentifier)
        tableView.dataSource = self
        tableView.delegate = self
        

    }
    

  
}

extension ConversationsListViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
         if section == 0 {
            return "Online"
         }else{
            return "History"
         }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainAppModel.getNumberCellFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: kCellidentifier, for: indexPath) as? ListTableViewCell {
            let model = MainAppModel.getCellModelFor(indexPath: indexPath)
            cell.dataModel = model
            return cell
        }
        //  дефолтная ячейка, по факту она возвращаться не будет
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "chatScreenSegue", sender: self)
        ConversationModel.setChatId(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
