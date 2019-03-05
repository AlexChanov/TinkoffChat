//
//  UserDefaults+Color.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 05/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

extension UserDefaults {
    func colorForKey(key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        return color
    }
    
    func setColor(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
        }
        set(colorData, forKey: key)
    }
}
