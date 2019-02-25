//
//  Debug.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 10/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

class Debug {
    
    //HomeWork1
    static func loggingLifeCycle(from: String?,to: String?, selectorFunction: String = #function) {
        
        var textForPrint = ""
        
        if from == nil,to == nil
        {
            textForPrint = selectorFunction
        }
        else if from != nil ,to != nil
        {
            textForPrint = "Application moved from <\(from ?? "")> to <\(to ?? "")>: <\(selectorFunction)>"
        }
        
        #if ENABLE_LOGS
        print(textForPrint)
        #endif
        
    }
    
    
}
