//
//  HomeViewController.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class HomeViewController: ViewController, HomeView {

    @IBOutlet weak var imgVwProfilePic: GPBImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblUserType: UILabel!
    
    var homePresenterImpl : HomePresenterImpl?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "GoPlayBook"

        let homeInteractorImpl = HomeInteractorImpl()
        
        homePresenterImpl  =  HomePresenterImpl(view: self, interactor: homeInteractorImpl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        homePresenterImpl?.getUserData()
        
    }
    func setUserProfile(user: UserModel) {
      
        
        if let fName = user.firstName {
            self.lblName.text = fName
        }
        
        if let emailId = user.email {
            self.lblEmail.text = emailId
        }
        
        if let imageURL = user.profilePicture {
            self.imgVwProfilePic.setImageWithURL(urlString: imageURL, placeHolder: nil)
        }
        
        if let userType = user.userType {
            
            if userType == "f" {
                self.lblUserType.text = "Facebook"
            } else {
                self.lblUserType.text = "Google"
            }
            
        }
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        homePresenterImpl?.logout()
    }

    func showLoadingIndicator() {
        super.showLoading()
    }
    
    func hideLoadingIndicator() {
        super.hideLoading()
    }
    
    func showMessage(error: String) {
        super.showMessage(title: nil, message: error)
    }
    
    func dimissHomeView() {
        self.dismiss(animated: true, completion: nil)
    }

}
