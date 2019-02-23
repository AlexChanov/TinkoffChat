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
    
    @IBOutlet weak var avatartImage: UIImageView!
    @IBOutlet weak var instalAvatarImage: UIButton!
    
    @IBAction func instalAvatarButton(_ sender: Any) {
        print("Выбери изображение профиля")
        showCameraAlertController()
    }
    @IBOutlet weak var editDescriptionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUIItems()
        print(editDescriptionButton.frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(editDescriptionButton?.frame ?? "no edit button frame yet")
        /*
         В методе init ещё не существует UI элементов, поэтому нет и фреймов
         */
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        /*
         Размеры фреймов в методах viewDidLoad и viewDidAppear отличаются потому что, верстка в сториборде
         происходит на экране который меньше чем экран который мы запускаем в симуляторе.
         По заданию в сториборде у нас IPhone SE, а тестируем на IPhone X. В методе viewDidAppear мы
         уже имеем перерисованные по модели симулятора UI элементы
         */
        print(editDescriptionButton.frame)
    }
    
    //MARK : - Настройка эллементов UI
    func settingUIItems()
    {
        avatartImage.layer.cornerRadius = instalAvatarImage.frame.size.height/2.0
        avatartImage.clipsToBounds = true
        instalAvatarImage.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        instalAvatarImage.layer.cornerRadius = avatartImage.layer.cornerRadius
        editDescriptionButton.layer.cornerRadius = editDescriptionButton.frame.size.height*0.2
        editDescriptionButton.layer.borderWidth = 1.0
        editDescriptionButton.layer.borderColor = UIColor.black.cgColor
        editDescriptionButton.backgroundColor = .white
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
