//
//  Helpers.swift
//  SmartBoy
//
//  Created by Prasanth pc on 2019-04-19.
//  Copyright © 2019 Prasanth pc. All rights reserved.
//

import UIKit

extension CALayer {
    func addBorder(with color: UIColor) {
        self.borderColor = color.cgColor
        self.borderWidth = 2.0
    }
}
