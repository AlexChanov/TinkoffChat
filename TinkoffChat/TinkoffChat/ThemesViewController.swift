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
    @IBOutlet var clouseButtonOutlet: UIButton!
    var model: Themes?
    var themesClosure: ThemesClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = Themes()
        
        theme1Outlet.layer.cornerRadius = theme1Outlet.frame.size.height*0.2
        theme2Outlet.layer.cornerRadius = theme2Outlet.frame.size.height*0.2
        theme3Outlet.layer.cornerRadius = theme3Outlet.frame.size.height*0.2
        clouseButtonOutlet.layer.cornerRadius = clouseButtonOutlet.frame.size.height*0.2
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
    @IBOutlet var theme1Outlet: UIButton!
    
    @IBAction func theme2Tap(_ sender: UIButton) {
        applyColor(model?.theme2)
    }
  
    @IBOutlet var theme2Outlet: UIButton!
    
    @IBAction func theme3Tap(_ sender: UIButton) {
        applyColor(model?.theme3)
    }
    @IBOutlet var theme3Outlet: UIButton!
    
    @IBAction func closeTap(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
}
