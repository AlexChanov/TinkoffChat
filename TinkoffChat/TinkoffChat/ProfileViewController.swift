//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 07/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit
import MobileCoreServices

class ProfileViewController: UIViewController {
    
    @IBAction func goBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var goBackOutletButton: UIButton!
    @IBOutlet weak var avatartImage: UIImageView!
    @IBOutlet weak var instalAvatarImage: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    
    @IBAction func GCDSaveButton(_ sender: Any) {
        saveInformationFromProfileTextField()
    }
    
    @IBAction func operationSaveButton(_ sender: Any) {
    saveInformationFromProfileTextField()
    }
    
    @IBAction func instalAvatarButton(_ sender: Any) {
        print("Выбери изображение профиля")
        showCameraAlertController()
    }
   
    var dataProfile = ""
    
    
    //MARK - save information
    
    func saveInformationFromProfileTextField(){
    
        let imageAvatar = UIImage(contentsOfFile: "placeholder-user")
        
        ProfileModel.data = [ProfileDataModel(name:nameTextField.text ?? "", description: descriptionTextField.text ?? "",avatar: avatartImage.image ?? imageAvatar!)]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUIItems()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
          }
    
    //MARK : - Настройка эллементов UI
    func settingUIItems()
    {
        avatartImage.layer.cornerRadius = instalAvatarImage.frame.size.height/2.0
        avatartImage.clipsToBounds = true
        instalAvatarImage.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        instalAvatarImage.layer.cornerRadius = avatartImage.layer.cornerRadius

        goBackOutletButton.layer.cornerRadius = goBackOutletButton.frame.size.height/2.0
    }
    
}

//MARK : - Камера и галерея
extension ProfileViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func showCameraAlertController()
    {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title:"Камера", style: .default, handler: {
            [weak self] _ in
            self?.showImagePicker(for: .camera)
        })
        let galeryAction = UIAlertAction(title: "Галерея", style: .default, handler: {
            [weak self] _ in
            self?.showImagePicker(for: .photoLibrary)
        })
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel , handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(galeryAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    func showImagePicker(for type: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(type){
            
            let imagePiker = UIImagePickerController()
            imagePiker.delegate = self
            imagePiker.sourceType = type
            imagePiker.mediaTypes = [kUTTypeImage as String]
            imagePiker.allowsEditing = false
            
            self.present(imagePiker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String
        self.dismiss(animated: true, completion: nil)

        if mediaType.isEqual(kUTTypeImage as String){
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            avatartImage.image = image
        }
    }
    
}
