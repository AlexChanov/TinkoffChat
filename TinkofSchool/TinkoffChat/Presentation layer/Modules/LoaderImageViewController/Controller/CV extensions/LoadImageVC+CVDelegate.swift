//
//  LoadImageVC+CVDelegate.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 22019 Чанов Алексей. All rights reserved.
//

import Foundation

extension LoaderImageViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DownloadImageCollectionViewCell else { return }
        if cell.imageUpload {
            performSegue(withIdentifier: "UnwindToProfile", sender: cell.downloadImage.image)
        } else {
            collectionView.reloadItems(at: [indexPath])
        }
    }
}
