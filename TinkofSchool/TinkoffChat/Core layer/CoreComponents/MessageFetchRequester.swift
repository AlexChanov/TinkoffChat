//
//  MessageFetchRequester.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import CoreData

protocol IMessageFetchRequester {
    func fetchMessagesFrom(conversationId: String) -> NSFetchRequest<Message>
}

class MessageFetchRequester: IMessageFetchRequester {

    func fetchMessagesFrom(conversationId: String) -> NSFetchRequest<Message> {
        let request: NSFetchRequest<Message> = Message.fetchRequest()
        request.predicate = NSPredicate(format: "conversationId == %@", conversationId)
        let sort = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sort]
        return request
    }
}
