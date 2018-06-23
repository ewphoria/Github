//
//  BaseNavigationController.swift
//  Github
//
//  Created by myMac on 23/06/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.string(forKey: UserDefaults.Keys.userID) != nil {
            
            self.performSegue(withIdentifier: "rootToHome", sender: nil)
            
        } else {
            self.performSegue(withIdentifier: "rootToSignup", sender: nil)
        }
    }

}
