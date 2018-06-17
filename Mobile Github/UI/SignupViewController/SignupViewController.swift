//
//  SignupViewController.swift
//  Github
//
//  Created by myMac on 17/06/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields

class SignupViewController: ViewController {
    
    @IBOutlet weak var txtUserName: MDCTextField!
    @IBOutlet weak var txtPassword: MDCTextField!
    @IBOutlet weak var txtConfirmPassword: MDCTextField!
    
    @IBOutlet weak var btnSignup: GPBButton!
    
    var emailTextFieldController = MDCTextInputControllerUnderline()
    var passwordTextFieldController = MDCTextInputControllerUnderline()
    var confirmPasswordTextFieldController = MDCTextInputControllerUnderline()
    
    let signupViewModel = SignupViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtUserName.clearButtonMode = .never
        txtPassword.clearButtonMode = .never
        txtConfirmPassword.clearButtonMode = .never
        
        emailTextFieldController = MDCTextInputControllerUnderline(textInput: txtUserName)
        passwordTextFieldController = MDCTextInputControllerUnderline(textInput: txtPassword)
        confirmPasswordTextFieldController = MDCTextInputControllerUnderline(textInput: txtConfirmPassword)

        _ = txtUserName.rx.text.map { $0 ?? ""}.bind(to: signupViewModel.userName)
        _ = txtPassword.rx.text.map { $0 ?? ""}.bind(to: signupViewModel.password)
        _ = txtConfirmPassword.rx.text.map { $0 ?? ""}.bind(to: signupViewModel.confirmPassword)
        
        _ = signupViewModel.isValid.bind(to: btnSignup.rx.isEnabled)
    }
    
    @IBAction func popViewController () -> Void {
        navigationController?.popViewController(animated: true)
    }
}
