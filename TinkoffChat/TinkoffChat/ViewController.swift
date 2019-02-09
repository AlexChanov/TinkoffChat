//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 07/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         ViewController.debug(text:"\(#function)")
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ViewController.debug(text:"\(#function)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        ViewController.debug(text: "\(#function)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ViewController.debug(text: "\(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        ViewController.debug(text: "\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        ViewController.debug(text: "\(#function)")
    }
    
 static func debug(text:String) {
            #if DEBUG
            print(text)
            #endif
    }
}

