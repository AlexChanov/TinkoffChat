//
//  Requests.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

struct PixabayRequest: IRequest {
    var urlRequest: URLRequest?

    init(apiKey: String) {
        var urlString = "https://pixabay.com/api/"
        urlString += ("?key=" + apiKey)
        let url = URL(string: urlString)!
        urlRequest = URLRequest(url: url)
        print(url.absoluteString)
    }
}
