//
//  PresentationAssembly.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol IPresentationAssembly {
    var serviceAssembly: IServiceAssembly { get }
    func getConversationListInteractor() -> IConversationListFetcher
    func getConversationInteractor() -> IConversationInteractor
    func getProfileInteractor() -> IProfileInteractor
    func getImageLoaderInteractor() -> IImageLoaderInteractor
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

    func getImageLoaderInteractor() -> IImageLoaderInteractor {
        return ImageLoaderInteractor(networkManager: serviceAssembly.imagesNetworkManager,
                                     imageDownloadManager: serviceAssembly.imageDownloadManager)
    }

    init(serviceAssembly: IServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
}
