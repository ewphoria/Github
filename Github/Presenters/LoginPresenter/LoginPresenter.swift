//
//  LoginPresenter.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenter {
    
    func login( email : String?, password : String?) -> Void
    
    func loginWithFacebook() -> Void
    
    func loginWithGoogle() -> Void
    
    //    func initLoginPresenter(view : Protocol, interactor : Protocol) -> Void
    
    init(view : LoginView, interactor : LoginInteractor)
}

class LoginPresenterImpl : LoginPresenter, OnLoginFinished {
    
    var loginInteractor: LoginInteractor?
    
    var loginView: LoginView?
    
    func login(email: String?, password: String?) {
        
        self.loginView?.showLoadingIndicator()
        self.loginInteractor?.performLogin(email: email, password: password, onLoginFinishedCallback: self)
    }
    
    required init(view : LoginView, interactor : LoginInteractor) {
        self.loginView = view
        self.loginInteractor = interactor
    }
    
    func loginDidSucceed() -> Void {
        self.loginView?.hideLoadingIndicator()
        self.loginView?.presentHomeView()
    }
    
    func loginDidFailedWithError(error : String) -> Void {
        self.loginView?.hideLoadingIndicator()
        self.loginView?.showMessage(error: error)
    }
    
    func loginWithFacebook() {
        
        self.loginInteractor?.performFacebookLogin(viewController : (self.loginView as? UIViewController)!, onLoginFinishedCallback: self)
    }
    
    func loginWithGoogle() {
        self.loginInteractor?.performGoogleLogin(viewController : (self.loginView as? UIViewController)!, onLoginFinishedCallback: self)
    }
}
