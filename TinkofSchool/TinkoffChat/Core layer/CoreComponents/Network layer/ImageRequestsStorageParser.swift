//
//  ImageDownloaderParser.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

struct ImageRequestsStorageParser: IParser {
    typealias Model = ImageRequestsStorage

    func parse(data: Data) -> ImageRequestsStorage? {
        let jsonDecoder = JSONDecoder()
        let imageDownloader = try? jsonDecoder.decode(ImageRequestsStorage.self, from: data)
        return imageDownloader
    }
}
