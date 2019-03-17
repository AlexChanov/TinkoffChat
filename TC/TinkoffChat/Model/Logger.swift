//
//  Logger.swift
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов] Алексей . All rights reserved.
//

import Foundation

class Logger {
    
    static let shared = Logger()
    
    private var previousState: String = "not running"
    
    private init(){}
    
    // логи печатаются, если выбрана конфигурация сборки - Debug (Задание со звёздочкой)
    func printStateLog(_ functionName: String, to state: String, didMoved: Bool){
        #if DEBUG
        if didMoved {
            print("Application moved from \(previousState) to \(state): \(functionName)")
        } else {
            print("Application will move from \(previousState) to \(state): \(functionName)")
        }
        previousState = state
        #endif
    }
    
    func printLog(name: String) {
        #if DEBUG
        print(name)
        #endif
    }
    
    func logThemeChanged(selectedTheme: UIColor){
        #if DEBUG
        print("Selected theme is \(selectedTheme)")
        #endif
    }
}