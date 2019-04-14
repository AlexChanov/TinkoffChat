//
//  Logger.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol ILogger {
    func printStateLog(_ functionName: String, to state: String, didMoved: Bool)
    func printLog(name: String)
    func logThemeChanged(selectedTheme: UIColor)
}

class Logger: ILogger {
    static let shared = Logger()

    private init() {}

    private var previousState: String = "not running"

    // логи печатаются, если выбрана конфигурация сборки - Debug (Задание со звёздочкой)
    func printStateLog(_ functionName: String, to state: String, didMoved: Bool) {
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

    func logThemeChanged(selectedTheme: UIColor) {
        #if DEBUG
        print("Selected theme is \(selectedTheme)")
        #endif
    }
}
