//
//  RequestConfig.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol IRequest {
    var urlRequest: URLRequest? { get }
}

protocol IParser {
    associatedtype Model
    func parse(data: Data) -> Model?
}

enum RequestResult<T> {
    case succes(T)
    case error(String)
}

struct RequestConfig<Parser: IParser> {
    var request: IRequest
    var parser: Parser
}
