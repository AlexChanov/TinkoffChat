//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 07/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var avatartImage: UIImageView!
    @IBOutlet weak var instalAvatarImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    avatartImage.layer.cornerRadius = 40
    instalAvatarImage.layer.cornerRadius = 40
// instalAvatarImage.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
//    instalAvatarImage.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//    instalAvatarImage.image.b
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
      
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
  
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
 
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
   
    }
    
}

