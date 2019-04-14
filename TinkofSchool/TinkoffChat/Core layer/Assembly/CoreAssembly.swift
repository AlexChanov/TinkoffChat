//
//  CoreAssembly.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol ICoreAssembly {
    var coreDataStack: CoreDataStack { get }
    var communicator: Communicator { get }
    var conversationRequester: IConversationFetchRequester { get }
    var userRequester: IUserFetchRequester { get }
    var messageRequester: IMessageFetchRequester { get }
    var requestSender: IRequestSender { get }
    var imageDwnldrConfig: RequestConfig<ImageRequestsStorageParser> { get }
    var imageProvider: IImageProvider { get }
}

class CoreAssembly: ICoreAssembly {
    lazy var coreDataStack: CoreDataStack = NestedWorkersCoreDataStack.shared
    lazy var communicator: Communicator = MultipeerCommunicator.shared
    lazy var conversationRequester: IConversationFetchRequester = ConversationFetchRequester()
    lazy var userRequester: IUserFetchRequester = UserFetchRequester()
    lazy var messageRequester: IMessageFetchRequester = MessageFetchRequester()
    lazy var requestSender: IRequestSender = RequestSender()
    lazy var imageDwnldrConfig = RequestsFactory.ImageLoaderFactory.imageDownloaderConfig()
    lazy var imageProvider: IImageProvider = ImageProvider.shared
}
