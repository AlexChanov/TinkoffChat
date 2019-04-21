//
//  ConversationFetchRequest.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import CoreData



class ConversationFetchRequester: IConversationFetchRequester {

    func fetchConversations() -> NSFetchRequest<Conversation> {
        let request: NSFetchRequest<Conversation> = Conversation.fetchRequest()
        let dateSortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        let onlineSortDescriptor = NSSortDescriptor(key: "isOnline", ascending: false)
        request.sortDescriptors = [onlineSortDescriptor, dateSortDescriptor]
        return request
    }

    func fetchOnlineConversations() -> NSFetchRequest<Conversation> {
        let request: NSFetchRequest<Conversation> = Conversation.fetchRequest()
        request.predicate = NSPredicate(format: "isOnline == YES")
        return request
    }

    func fetchConversationWith(conversationId: String) -> NSFetchRequest<Conversation> {
        let request: NSFetchRequest<Conversation> = Conversation.fetchRequest()
        request.predicate = NSPredicate(format: "conversationId == %@", conversationId)
        return request
    }

    func fetchNonEmptyOnlineConversations() -> NSFetchRequest<Conversation> {
        let request: NSFetchRequest<Conversation> = Conversation.fetchRequest()
        request.predicate = NSPredicate(format: "messageHistory.@count > 0 AND user.isOnline == 1")
        return request
    }
}
