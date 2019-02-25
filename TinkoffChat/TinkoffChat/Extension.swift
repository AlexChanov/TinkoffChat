//
//  Extension.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 23/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

extension Date {
    
    // метод для получения строкового представления даты для ячейки
    func stringForCell() -> String {
        
        let today = Date()
        
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: today)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        if components.day! == 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: self)
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "dd MMMM"
            return dateFormatter.string(from: self)
        }
    }
    
    // метод для создания даты из строки
    static func initWithString (_ string: String ) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZ"
        let date = dateFormatter.date(from: string)!
        return date
    }
}
