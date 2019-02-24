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
    
    var nameFriend : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            nameFriend = ConversationModel.getChatModel()?.name
            self.namePersonLabel.text = self.nameFriend ?? ""
    
}
        
        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
