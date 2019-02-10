//
//  Debug.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 10/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

class Debug {
    
    // switch flag ON or OFF
    static func loggingLifeCycle(text:String) {
        #if ON
        print(text)
        #endif
    }
}
