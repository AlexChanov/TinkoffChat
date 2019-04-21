//
//  Profile.swift
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

import UIKit

protocol IProfile {
    var name: String { get set }
    var description: String { get set }
    var userImageData: Data { get set }
}

struct Profile: IProfile {
    var name: String
    var description: String
    var userImageData: Data
}
