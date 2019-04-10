//
//  RootAssembly.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 24/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import Foundation

class RootAssembly {
    lazy var presentationAssembly: IPresentationAssembly = PresentationAssembly(serviceAssembly: self.serviceAssembly)
    private lazy var serviceAssembly: IServiceAssembly = ServiceAssembly(coreAssembly: self.coreAssembly)
    private lazy var coreAssembly: ICoreAssembly = CoreAssembly()
}
