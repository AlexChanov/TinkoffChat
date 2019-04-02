//
//  Message.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import CoreData

extension Message {
    static func insertNewMessage(in context: NSManagedObjectContext) -> Message {
        guard let message = NSEntityDescription.insertNewObject(forEntityName: "Message",
                                                                into: context) as? Message else {
            fatalError("Can't create Message entity")
        }
        return message
    }

    static func findMessagesFrom(conversationId: String, in context: NSManagedObjectContext) -> [Message]? {
        let request = FetchRequestManager.shared.fetchMessagesFrom(conversationId: conversationId)
        do {
            let messages = try context.fetch(request)
            return messages
        } catch {
            assertionFailure("Can't get messages by a fetch. May be there is an incorrect fetch")
            return nil
        }
    }
}
