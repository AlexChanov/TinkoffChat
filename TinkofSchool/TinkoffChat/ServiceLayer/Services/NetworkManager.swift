//
//  NetworkManager.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol INetworkManager {
    associatedtype Parser: IParser
    typealias Model = Parser.Model
    var config: RequestConfig<Parser> { get }
    var requestSender: IRequestSender { get }
    func send()
}

protocol NetworkManagerDelegate: class {
    func modelDidLoad<Model>(model: Model)
    func handleError(description: String)
}

class NetworkManager<Parser: IParser> {
    typealias Model = Parser.Model
    var config: RequestConfig<Parser>
    var requestSender: IRequestSender
    weak var delegate: NetworkManagerDelegate?

    init(requestSender: IRequestSender, config: RequestConfig<Parser>) {
        self.config = config
        self.requestSender = requestSender
    }

    func send() {
        requestSender.send(config: config) { (result) in
            switch result {
            case .succes(let model):
                self.delegate?.modelDidLoad(model: model)
            case .error(let description):
                self.delegate?.handleError(description: description)
            }
        }
    }
}
