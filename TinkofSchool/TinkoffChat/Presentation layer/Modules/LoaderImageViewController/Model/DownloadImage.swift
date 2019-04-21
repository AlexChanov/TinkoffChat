//
//  DownloadImage.swift
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol IImageRequestsStorage {
    var imagesURL: [ImageRequest] { get }
}

struct ImageRequestsStorage: IImageRequestsStorage, Codable {
    var imagesURL: [ImageRequest]

    enum CodingKeys: String, CodingKey {
        case imagesURL = "hits"
    }
}

struct ImageRequest: Codable {
    var url: URL?

    enum CodingKeys: String, CodingKey {
        case url = "userImageURL"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decode(URL.self, forKey: .url)
    }
}
