//
//  LoginViewController.swift
//  SmartBoy
//
//  Created by Prasanth pc on 2019-04-18.
//  Copyright © 2019 Prasanth pc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "SmartBoyViewController", sender: nil)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
    }
}
