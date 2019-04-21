//
//  RequestsFactory.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

struct RequestsFactory {
    struct ImageLoaderFactory {
        static func imageDownloaderConfig() -> RequestConfig<ImageRequestsStorageParser> {
            return RequestConfig<ImageRequestsStorageParser>(request:
                PixabayRequest(apiKey: "10775117-3ca4fced431dda046ab116e20"),
                                                        parser: ImageRequestsStorageParser())
        }
    }
}
