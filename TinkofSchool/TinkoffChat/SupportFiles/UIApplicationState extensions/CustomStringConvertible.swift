//
//  UIApplicationState extensions.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Алексей. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication.State: CustomStringConvertible {
    public var description: String {
        switch self {
        case .active:
            return("active")
        case .inactive:
            return("inactive")
        case .background:
            return("background")
        @unknown default:
            return("unknown")
        }
    }
}
