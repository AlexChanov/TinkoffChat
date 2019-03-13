//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 07/02/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit
import MobileCoreServices

class ProfileViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBAction func goBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var goBackOutletButton: UIButton!
    @IBOutlet weak var avatartImage: UIImageView!
    @IBOutlet weak var instalAvatarImage: UIButton!
    
    @IBOutlet var aboutProfileTextView: UITextView!
    @IBOutlet var profileNameTextField: UITextField!
    @IBAction func instalAvatarButton(_ sender: Any) {
        
        takePhotoProfile(cameraOff: false)
    }
    @IBOutlet weak var editDescriptionButton: UIButton!
    @IBOutlet var operationButton: UIButton!
    @IBOutlet var gcdButton: UIButton!
    
    @IBAction func editData(_ sender: UIButton) {
        self.fieldProfileEnable()
        self.buttonEditHidden()
        self.buttonSaveDisable()
    }
    
    @IBAction func editActionStart(_ sender: Any) {
        buttonSaveEnable()
    }
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        saveAllData(sender)
    }
    
    var saveDataOnMemory = SaveData()
    let InstanceGcdQueue = ReadWriteData.GCDDataManager()
    let InstanceOperationQueue = ReadWriteData.OperationDataManager()
    
    enum ImageSource {
        case photoLibrary
        case camera
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutProfileTextView.delegate = self
        profileNameTextField.delegate = self
        loadProfileData()
        settingUIItems()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //настраиваем интерфейс
        super.viewWillAppear(true)
        buttonEditUnHidden()
        fieldProfileDisable()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    //MARK : - Настройка эллементов UI
    func settingUIItems()
    {
        
        gcdButton.layer.borderWidth = 1
        operationButton.layer.borderWidth = 1
        
        avatartImage.layer.cornerRadius = instalAvatarImage.frame.size.height/2.0
        avatartImage.clipsToBounds = true
        instalAvatarImage.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        instalAvatarImage.layer.cornerRadius = avatartImage.layer.cornerRadius
        
        gcdButton.layer.cornerRadius = gcdButton.frame.size.height*0.2
        gcdButton.layer.borderWidth = 1
        gcdButton.layer.borderColor = UIColor.black.cgColor
        
        operationButton.layer.cornerRadius = gcdButton.frame.size.height*0.2
        operationButton.layer.borderWidth = 1
        operationButton.layer.borderColor = UIColor.black.cgColor
        
        editDescriptionButton.layer.cornerRadius = editDescriptionButton.frame.size.height*0.2
        editDescriptionButton.layer.borderWidth = 1.0
        editDescriptionButton.layer.borderColor = UIColor.black.cgColor
        goBackOutletButton.layer.cornerRadius = goBackOutletButton.frame.size.height/2.0
    }
    
    func saveAllData(_ sender: UIButton ) {
        
        activityIndicator.startAnimating()
        buttonSaveDisable()
        switch sender.currentTitle {
        case "GCD":
            GCDSave()
        case "Operation":
            operationSave()
        default:
            break
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (profileNameTextField.text?.count)! < 60 {
            self.saveDataOnMemory.saveProfileName = true
            return true
        } else {
            profileNameTextField.text?.removeLast()
            return true
        }
    }
    
    private func loadProfileData() {
        
        var profileNameTxt:String?
        var aboutProfileTextView:String?
        var profileImageView:UIImage
        
        InstanceGcdQueue.nameOfFile = "profileName.txt"
        profileNameTxt = InstanceGcdQueue.txtREadfile()
        InstanceGcdQueue.nameOfFile = "profileAbout.txt"
        aboutProfileTextView = InstanceGcdQueue.txtREadfile()
        InstanceGcdQueue.nameOfFile = "userprofile.jpg"
        profileImageView = InstanceGcdQueue.getImage()
        
        DispatchQueue.main.async {
            self.profileNameTextField.text =  profileNameTxt
            self.aboutProfileTextView.text = aboutProfileTextView
            self.avatartImage.image = profileImageView
        }
        
        
    }
    
     func buttonSaveEnable() {
        DispatchQueue.main.async {
            self.gcdButton.isEnabled = true
            self.operationButton.isEnabled = true
        }
        
    }
    
     func buttonSaveDisable() {
        
        self.gcdButton.isEnabled = false
        self.operationButton.isEnabled = false
        
    }
    
     func buttonEditUnHidden() {
        DispatchQueue.main.async {
            self.editDescriptionButton.isHidden = false
            self.gcdButton.isHidden = true
            self.operationButton.isHidden = true
        }
    }
    
     func buttonEditHidden() {
        editDescriptionButton.isHidden = true
        gcdButton.isHidden = false
        operationButton.isHidden = false
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.buttonSaveEnable()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        saveDataOnMemory.saveAbout = true
    }
    
     func saveDataStart() {
        
        self.saveDataOnMemory.saveData = true
        self.buttonAfterSave()
        DispatchQueue.main.async {
            self.showAlert(textMessage: self.saveDataOnMemory.textAlertFunc())
        }
        
        self.fieldProfileDisable()
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
        
    }
    
     func fieldProfileDisable() {
        DispatchQueue.main.async {
            self.profileNameTextField.isEnabled = false
            self.aboutProfileTextView.isEditable = false
            self.instalAvatarImage.isEnabled = false
        }
    }
    
     func fieldProfileEnable() {
        self.profileNameTextField.isEnabled = true
        self.aboutProfileTextView.isEditable = true
        self.instalAvatarImage.isEnabled = true
    }
    
     func buttonAfterSave() {
        self.buttonSaveEnable()
        self.buttonEditUnHidden()
    }
    
    func operationSave(){
        
        let selectedImage = self.avatartImage.image!
        let text = profileNameTextField.text!
        let textAbout = aboutProfileTextView.text!
        
        InstanceOperationQueue.operationQueue.addOperation {
            if self.saveDataOnMemory.saveProfileName {
                self.InstanceGcdQueue.nameOfFile = "profileName.txt"
                self.InstanceGcdQueue.text = text
                self.InstanceGcdQueue.txtWriteFile()
                
            }
        }
        InstanceOperationQueue.operationQueue.waitUntilAllOperationsAreFinished()
        InstanceOperationQueue.operationQueue.addOperation {
            if self.saveDataOnMemory.saveAbout {
                self.InstanceGcdQueue.nameOfFile = "profileAbout.txt"
                self.InstanceGcdQueue.text = textAbout
                self.InstanceGcdQueue.txtWriteFile()
                
            }
        }
        InstanceOperationQueue.operationQueue.waitUntilAllOperationsAreFinished()
        InstanceOperationQueue.operationQueue.addOperation {
            if self.saveDataOnMemory.savePhoto {
                self.InstanceGcdQueue.nameOfFile = "userprofile.jpg"
                self.InstanceGcdQueue.selectedImage = selectedImage
                self.InstanceGcdQueue.saveImage()
                
            }
        }
        InstanceOperationQueue.operationQueue.waitUntilAllOperationsAreFinished()
        InstanceOperationQueue.operationQueue.addOperation {
            self.saveDataStart()
            self.loadProfileData()
        }
    }
    
    
    
    
    

    func showAlert(textMessage: String) {
        let alertController = UIAlertController(title: nil, message: textMessage, preferredStyle: .alert)
        let actionSave = UIAlertAction(title: "ОК" , style: .default) { (action) in
            
        }
        let actionRepeat = UIAlertAction(title: "Повторить" , style: .default) { (action) in
            self.activityIndicator.startAnimating()
            self.saveDataOnMemory.saveData = true
            self.InstanceGcdQueue.queueMain.async {
                self.saveDataStart()
                self.loadProfileData()
            }
            
        }
        alertController.addAction(actionSave)
        if !saveDataOnMemory.saveData {
            alertController.addAction(actionRepeat)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func GCDSave(){
        let selectedImage = self.avatartImage.image!
        let text = profileNameTextField.text!
        let textAbout = aboutProfileTextView.text!
        
        if self.saveDataOnMemory.saveProfileName {
            InstanceGcdQueue.nameOfFile = "profileName.txt"
            InstanceGcdQueue.text = text
            InstanceGcdQueue.txtWriteFile()
        }
        
        if self.saveDataOnMemory.saveAbout  {
            InstanceGcdQueue.nameOfFile = "profileAbout.txt"
            InstanceGcdQueue.text = textAbout
            InstanceGcdQueue.txtWriteFile()
        }
        
        if self.saveDataOnMemory.savePhoto {
            InstanceGcdQueue.nameOfFile = "userprofile.jpg"
            InstanceGcdQueue.selectedImage = selectedImage
            InstanceGcdQueue.saveImage()
        }
        
        DispatchQueue.global().sync {
            self.saveDataStart()
            self.loadProfileData()
        }
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
        
        var selectImageFromPicker:UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectImageFromPicker = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectImageFromPicker = originalImage
        }
        if let selectedImage = selectImageFromPicker {
            avatartImage.image = selectedImage
            self.saveDataOnMemory.savePhoto = true
            
        }
        dismiss(animated: true, completion: {
            self.buttonSaveEnable()
            self.fieldProfileEnable()
            self.buttonEditHidden()
            self.settingUIItems()
        })
    }
    
    private func takePhotoProfile(cameraOff: Bool) {
        
        var titleForCamera = "Фото"
        
        if cameraOff {
            titleForCamera = "Нет доступа к камере"
        }
        
        let alertController = UIAlertController(title: "", message: "Выберите фотографию для профиля", preferredStyle: .actionSheet)
        let actionPhoto = UIAlertAction(title: titleForCamera , style: .default) { (action) in
            self.handleSelectProfileImageView(.camera)
        }
        let actionLibrary = UIAlertAction(title: "Библиотека", style: .default) { (action) in
            self.handleSelectProfileImageView(.photoLibrary)
        }
        let deletePhotoProfile = UIAlertAction(title: "Удалить фото", style: .destructive) { (action) in
            let selectedImage = UIImage(named: "placeholder-user")
            self.avatartImage.image = selectedImage
            self.saveDataOnMemory.savePhoto = false
            
            DispatchQueue.global().async {
                self.InstanceGcdQueue.removeImage(nameOfFile: "userprofile.jpg")
            }
            self.buttonSaveEnable()
            
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel) { (action) in
        }
        alertController.addAction(actionPhoto)
        alertController.addAction(actionLibrary)
        alertController.addAction(actionCancel)
        
        if self.avatartImage.image != UIImage(named: "placeholder-user") {
            alertController.addAction(deletePhotoProfile)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    //выбор фотографии в профайл
    func handleSelectProfileImageView(_ source: ImageSource){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        switch source {
        case .camera:
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                takePhotoProfile(cameraOff: true)
                return
            }
            picker.sourceType = .camera
        case .photoLibrary:
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: {
            self.fieldProfileEnable()
        })
        
        
    }
}
