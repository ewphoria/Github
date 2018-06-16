//
//  LoginViewController.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialTextFields
import RxCocoa
import RxSwift

class LoginViewController: ViewController, LoginView {
    
    @IBOutlet var txtEmail: MDCTextField!
    @IBOutlet var txtPassword: MDCTextField!
    @IBOutlet var btnLogin: GPBButton!
    
    var emailTextFieldController = MDCTextInputControllerUnderline()
    var passwordTextFieldController = MDCTextInputControllerUnderline()
    
    let signinViewModel = SigninViewModel()
    
    var loginPresenterImpl : LoginPresenterImpl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.clearButtonMode = .never
        txtPassword.clearButtonMode = .never
        
        emailTextFieldController = MDCTextInputControllerUnderline(textInput: txtEmail)
        passwordTextFieldController = MDCTextInputControllerUnderline(textInput: txtPassword)
        
        _ = txtEmail.rx.text.map { $0 ?? ""}.bind(to: signinViewModel.userName)
        _ = txtPassword.rx.text.map { $0 ?? ""}.bind(to: signinViewModel.password)
        
        _ = signinViewModel.isValid.bind(to: btnLogin.rx.isEnabled)

        //let loginInteractorImpl = LoginInteractorImpl()
        
        //loginPresenterImpl  =  LoginPresenterImpl(view: self, interactor: loginInteractorImpl)
        //btnLogin.isEnabled = false
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        
        btnLogin.isEnabled = true
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