//
//  ServiceAssembly.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 12/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

protocol IServiceAssembly {
    var profileDataManager: ProfileDataManager { get }
    var logger: ILogger { get }
    var communicationManager: ICommunicationManager { get }
}

class ServiceAssembly: NSObject, IServiceAssembly {
    var coreAssembly: ICoreAssembly
    lazy var profileDataManager: ProfileDataManager = StorageManager(coreDataStack: coreAssembly.coreDataStack)

    var logger: ILogger = Logger.shared

    lazy var communicationManager: ICommunicationManager = CommunicationManager(name: (
        UserDefaults.standard.string(forKey: "name")
        ??
        UIDevice.current.name),
                                communicator: coreAssembly.communicator,
                                coreDataStack: coreAssembly.coreDataStack,
                                userRequester: coreAssembly.userRequester,
                                conversationRequester: coreAssembly.conversationRequester,
                                messageRequester: coreAssembly.messageRequester)

    init(coreAssembly: ICoreAssembly) {
        self.coreAssembly = coreAssembly
    }
}
