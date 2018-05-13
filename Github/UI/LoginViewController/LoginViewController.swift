//
//  LoginViewController.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class LoginViewController: GPBViewController, LoginView {

    @IBOutlet var txtEmail: UITextField!
    
    @IBOutlet var txtPassword: UITextField!

    var loginPresenterImpl : LoginPresenterImpl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginInteractorImpl = LoginInteractorImpl()
        
        loginPresenterImpl  =  LoginPresenterImpl(view: self, interactor: loginInteractorImpl)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        
        loginPresenterImpl?.login(email: txtEmail.text, password: txtPassword.text)
        
    }
    
    @IBAction func actionFacebook(_ sender: Any) {
        
        loginPresenterImpl?.loginWithFacebook()
        
    }
    
    @IBAction func actionGoogle(_ sender: Any) {
        
        loginPresenterImpl?.loginWithGoogle()
        
    }
    
    // MARK: LoginView Methods Implementation
    
    func showMessage(error: String) {
        super.showMessage(title: nil, message: error)
    }
    
    func presentHomeView() {
        
        self.performSegue(withIdentifier: "presentHome", sender: nil)
        
    }
    
    func showLoadingIndicator() {
        super.showLoading()
    }
    
    func hideLoadingIndicator() {
        super.hideLoading()
    }
}
