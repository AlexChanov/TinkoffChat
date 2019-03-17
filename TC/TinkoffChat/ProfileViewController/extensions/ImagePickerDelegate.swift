//
//  ImagePickerDelegate.swift
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов] Алексей . All rights reserved.
//

import UIKit

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPhoto = info[.originalImage] as? UIImage else { return }
        avatarOfUserImageView.image = userPhoto
        isPhotoSelected = true
        dismiss(animated: true, completion: nil)
        handleEnablingSaveButtons()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
