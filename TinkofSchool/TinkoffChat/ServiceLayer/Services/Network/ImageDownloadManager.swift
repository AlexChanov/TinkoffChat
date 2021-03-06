//
//  ImageDownloadManager.swift
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import Foundation

protocol IImageDownloadManager {
    var imageProvider: IImageProvider { get }
    func send(url: URL, completionImageHandler: @escaping (Data?) -> Void)
}

class ImageDownloadManager: IImageDownloadManager {
    var imageProvider: IImageProvider

    init(imageProvider: IImageProvider) {
        self.imageProvider = imageProvider
    }

    func send(url: URL, completionImageHandler: @escaping (Data?) -> Void) {
        imageProvider.downloadImage(url: url) { (result) in
            switch result {
            case .succes(let data):
                completionImageHandler(data)
            case .error:
                completionImageHandler(nil)
            }
        }
    }
}
