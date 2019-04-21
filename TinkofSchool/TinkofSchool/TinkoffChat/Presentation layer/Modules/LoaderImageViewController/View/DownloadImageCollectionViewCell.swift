//
//  DownloadImageCollectionViewCell.swift
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import UIKit

class DownloadImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet var downloadImage: UIImageView!
    var imageUpload: Bool = false
    var url: URL!
}
