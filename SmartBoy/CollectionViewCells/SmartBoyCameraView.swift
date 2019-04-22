
//
//  SmartBoyCameraView4.swift
//  SmartBoy
//
//  Created by Prasanth pc on 2019-04-22.
//  Copyright © 2019 Prasanth pc. All rights reserved.
//

import UIKit

class SmartBoyCameraView: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let arViewController = ARViewController()
        self.addSubview(arViewController.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
