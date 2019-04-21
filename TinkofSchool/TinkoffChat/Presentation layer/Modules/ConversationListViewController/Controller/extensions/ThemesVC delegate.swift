//
//  ThemesVC delegate.swift
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//
import UIKit

extension ConversationListViewController: ThemesViewControllerDelegate {

    func themesViewController(_ controller: ThemesViewController, didSelect selectedTheme: UIColor) {
        controller.view.backgroundColor = selectedTheme
        UINavigationBar.appearance().barTintColor = selectedTheme
        DispatchQueue.global(qos: .utility).async {
            guard let colorData =  try? NSKeyedArchiver.archivedData(withRootObject: selectedTheme,
                                                                     requiringSecureCoding: false) else { return }
            UserDefaults.standard.set(colorData, forKey: "Theme")
        }
        Logger.shared.logThemeChanged(selectedTheme: selectedTheme)
    }

}
