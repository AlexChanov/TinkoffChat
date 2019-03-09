//
//  ProfileDataModel.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 09/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

class ProfileDataModel {
    
    var name : String
    var description : String
    var avatar : Any
    init(name: String,description:String, avatar:Any) {
        self.name = name
        self.description = description
        self.avatar = avatar as! UIImage
    }
    
 
}

// уточнить о разделение

class ProfileModel {
    
   static var data : [ProfileDataModel] = []
   {
    didSet{
    
        print( "твое имя =\(data[0].name), информация о тебе = \(data[0].description)"
)
     //   print(" Имя пользователя = data), Информация о пользовтаеле = \(self.data.)")
    }
    
    }
}
