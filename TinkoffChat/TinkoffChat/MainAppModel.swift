//
//  MainAppModel.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 23/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

struct MainAppModel {
    
    // массив, где мы храним наши прототимы с моделями для для ячеек онлайн секции.
    static private let onlineСellDataPrototyps : [ListTableViewCellDataModel] = [
        ListTableViewCellDataModel(name: "Черный властелин", message: "Че каво, братишка?", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: true, hasUnreadMessage: true),
        ListTableViewCellDataModel(name: "Олег Виталич", message: "Бери картку, быстра !!!11", date: Date.initWithString("2019-02-22 14:38:05 +0000"), online: true, hasUnreadMessage: false)
    ]
    
    // массив, где мы храним наши прототимы с моделями для для ячеек офлайн секции
    static private let offlineСellDataPrototyps : [ListTableViewCellDataModel] = [
        ListTableViewCellDataModel(name: "Антонина Сергеевна", message: "Сдаем по 500р Семеновне на др до четверга!", date: Date.initWithString("2019-01-19 12:38:05 +0000"), online: false, hasUnreadMessage: false)
    ]

    // метод для определения количества ячеек в секциях
    static func getNumberCellFor( section: Int) -> Int {
        if section == 0 {
            return onlineСellDataPrototyps.count
        } else {
            return offlineСellDataPrototyps.count
        }
    }
    
    // метод мы используем для получения модели для ячейки
    static func getCellModelFor( indexPath: IndexPath ) -> ListTableViewCellProtocol {
        if indexPath.section == 0 {
            return onlineСellDataPrototyps[indexPath.row]
        } else {
            return offlineСellDataPrototyps[indexPath.row]
        }
    }



}
