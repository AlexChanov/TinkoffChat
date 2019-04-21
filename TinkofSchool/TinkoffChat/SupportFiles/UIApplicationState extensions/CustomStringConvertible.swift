//
//  UIApplicationState extensions.swift
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
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
