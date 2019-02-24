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
    //убрал приватность чтобы использовать во второй модели
    static let onlineСellDataPrototyps : [ListTableViewCellDataModel] = [
        ListTableViewCellDataModel(name: "Черный властелин", message: "Че каво, братишка?", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: true, hasUnreadMessage: true),
        ListTableViewCellDataModel(name: "Олег Виталич", message: "Бери картку, быстра !!!11", date: Date.initWithString("2019-02-22 14:38:05 +0000"), online: true, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Аня", message: "Че каво, братишка?", date: Date.initWithString("2019-04-11 12:38:05 +0000"), online: true, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Мама", message: "Надень шапку", date: Date.initWithString("2019-12-30 12:38:05 +0000"), online: true, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Тренер", message: "На треню не опоздай", date: Date.initWithString("2019-05-13 12:38:05 +0000"), online: true, hasUnreadMessage: true),
        ListTableViewCellDataModel(name: "Эльдар", message: "Спасибо", date: Date.initWithString("2019-02-21 12:38:05 +0000"), online: true, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Илья", message: "Завтра увидимся", date: Date.initWithString("2019-08-22 12:38:05 +0000"), online: true, hasUnreadMessage: true),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-01-09 12:38:05 +0000"), online: true, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-03-05 12:38:05 +0000"), online: true, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: true, hasUnreadMessage: false)]
    
    // массив, где мы храним наши прототимы с моделями для для ячеек офлайн секции
    static let offlineСellDataPrototyps : [ListTableViewCellDataModel] = [
        ListTableViewCellDataModel(name: "Антонина Сергеевна", message: "Сдаем по 500р Семеновне на др до четверга!", date: Date.initWithString("2019-01-19 12:38:05 +0000"), online: false, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Серега", message: "Я домой,если что ищи меня там", date: Date.initWithString("2019-02-22 14:38:05 +0000"), online: false, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: false, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-11-02 12:38:05 +0000"), online: false, hasUnreadMessage: true),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-05-23 12:38:05 +0000"), online: false, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: false, hasUnreadMessage: true),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: false, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: false, hasUnreadMessage: false),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: false, hasUnreadMessage: true),
        ListTableViewCellDataModel(name: "Неизвестный номер", message: "Какой-то текст", date: Date.initWithString("2019-01-22 12:38:05 +0000"), online: false, hasUnreadMessage: false)]
    

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
