//
//  HomeViewController.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class HomeViewController: ViewController {

    @IBOutlet weak var imgVwProfilePic: GPBImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblUserType: UILabel!
    
    var homePresenterImpl : HomePresenterImpl?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "GitHub"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
