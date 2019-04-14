//
//  CommunicationIntegrate.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//
import UIKit

protocol CommunicationIntegrator: class {
    func handleError(error: Error)
}

extension CommunicationIntegrator where Self: UIViewController {
    func handleError(error: Error) {
        let alert = UIAlertController(title: "Проблемы с соединением", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
