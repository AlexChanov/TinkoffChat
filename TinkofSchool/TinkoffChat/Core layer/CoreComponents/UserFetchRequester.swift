//
//  UserFetchRequester.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import CoreData

protocol IUserFetchRequester {
    func fetchUserWith(userId: String) -> NSFetchRequest<User>
    func fetchOnlineUsers() -> NSFetchRequest<User>
}

class UserFetchRequester: IUserFetchRequester {

    func fetchUserWith(userId: String) -> NSFetchRequest<User> {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "userId == %@", userId)
        return request
    }

    func fetchOnlineUsers() -> NSFetchRequest<User> {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "isOnline == YES")
        return request
    }
}
