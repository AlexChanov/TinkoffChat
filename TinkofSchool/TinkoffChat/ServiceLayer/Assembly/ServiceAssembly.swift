//
//  ServiceAssembly.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol IServiceAssembly {
    var profileDataManager: ProfileDataManager { get }
    var logger: ILogger { get }
    var communicationManager: ICommunicationManager { get }
    var imagesNetworkManager: NetworkManager<ImageRequestsStorageParser> { get }
    var imageDownloadManager: IImageDownloadManager { get }
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
    lazy var imagesNetworkManager = NetworkManager<ImageRequestsStorageParser>(
        requestSender: coreAssembly.requestSender,
        config: coreAssembly.imageDwnldrConfig)
    lazy var imageDownloadManager: IImageDownloadManager = ImageDownloadManager(
        imageProvider: coreAssembly.imageProvider)
    init(coreAssembly: ICoreAssembly) {
        self.coreAssembly = coreAssembly
    }
}
