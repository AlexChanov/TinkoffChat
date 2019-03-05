//
//  ThemesViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 05/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import UIKit

typealias ThemesClosure = (_ color: UIColor) -> (Void)

class ThemesViewController: UIViewController {
    var model: Themes?
    var themesClosure: ThemesClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = Themes()
    }
    
    func applyColor(_ color: UIColor?) {
        guard let color = color else { return }
        
        view.backgroundColor = color
        themesClosure?(color)
        AppDelegate.changeAppearance(color)
    }
    
    @IBAction func theme1Tap(_ sender: UIButton) {
        applyColor(model?.theme1)
    }
    
    @IBAction func theme2Tap(_ sender: UIButton) {
        applyColor(model?.theme2)
    }
    
    @IBAction func theme3Tap(_ sender: UIButton) {
        applyColor(model?.theme3)
    }
    
    @IBAction func closeTap(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
}
