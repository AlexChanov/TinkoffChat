//
//  ConversationList.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import CoreData

typealias IConversationListFetcher = IConversationList & IFetchedResultSettuper
protocol IConversationList {
    var communicationManager: ICommunicationManager { get }
    func setIntegrator(communicationIntegrator: CommunicationIntegrator)
}

@objc protocol IFetchedResultSettuper {
    @objc optional func setupConversationsFetchedResultController() -> NSFetchedResultsController<Conversation>
    @objc optional func setupMessagesFetchedResultController(userID: String) -> NSFetchedResultsController<Message>
}

class ConversationListInteractor: IConversationListFetcher {

    var communicationManager: ICommunicationManager

    init(communicationManager: ICommunicationManager) {
        self.communicationManager = communicationManager
    }

    func setIntegrator(communicationIntegrator: CommunicationIntegrator) {
        communicationManager.delegate = communicationIntegrator
    }

    func setupConversationsFetchedResultController() -> NSFetchedResultsController<Conversation> {
        let request = communicationManager.conversationRequester.fetchConversations()
        request.fetchBatchSize = 20
        let mainContext = communicationManager.coreDataStack.mainContext
        let fetchResultController = NSFetchedResultsController(fetchRequest: request,
                                                           managedObjectContext: mainContext,
                                                           sectionNameKeyPath: "isOnline",
                                                           cacheName: nil)
        return fetchResultController
    }
}
