//
//  PresentationAssembly.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 24/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

protocol IPresentationAssembly {
    var serviceAssembly: IServiceAssembly { get }
    func getConversationListInteractor() -> IConversationListFetcher
    func getConversationInteractor() -> IConversationInteractor
    func getProfileInteractor() -> IProfileInteractor
}

class PresentationAssembly: IPresentationAssembly {
    var serviceAssembly: IServiceAssembly

    func getConversationListInteractor() -> IConversationListFetcher {
        return ConversationListInteractor(communicationManager: serviceAssembly.communicationManager)
    }

    func getConversationInteractor() -> IConversationInteractor {
        return ConversationInteractor(communicationManager: serviceAssembly.communicationManager)
    }

    func getProfileInteractor() -> IProfileInteractor {
        return ProfileInteractor(profileDataManager: serviceAssembly.profileDataManager)
    }

    init(serviceAssembly: IServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
}
