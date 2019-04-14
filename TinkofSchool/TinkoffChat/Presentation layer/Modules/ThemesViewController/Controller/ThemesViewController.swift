//
//  ThemesViewController.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import UIKit

typealias ColorChangedHandler = (UIColor) -> Void
class ThemesViewController: UIViewController {

    @IBOutlet var themesButtons: [UIButton]!
    private let model: Themes!
    var colorHandler: ColorChangedHandler!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = navigationController?.navigationBar.barTintColor
    }
    @IBAction func themeButtonTapped(_ sender: UIButton) {
        if sender == themesButtons[0] {
            colorHandler(model.theme1)
            navigationController?.navigationBar.barTintColor = model.theme1
            view.backgroundColor = model.theme1
        } else if sender == themesButtons[1] {
            colorHandler(model.theme2)
            navigationController?.navigationBar.barTintColor = model.theme2
            view.backgroundColor = model.theme2
        } else {
            colorHandler(model.theme3)
            navigationController?.navigationBar.barTintColor = model.theme3
            view.backgroundColor = model.theme3
        }
    }

}
