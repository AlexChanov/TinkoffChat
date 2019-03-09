//
//  DisplayProfileViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 07/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

class DisplayProfileViewController: UIViewController {

    @IBOutlet weak var editDescriptionButton: UIButton!
    @IBOutlet weak var avatartImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

                editDescriptionButton.layer.cornerRadius = editDescriptionButton.frame.size.height*0.2
                editDescriptionButton.layer.borderWidth = 1.0
                editDescriptionButton.layer.borderColor = UIColor.black.cgColor
                editDescriptionButton.backgroundColor = .white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
