//
//  LoginInteractir.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

protocol OnLoginFinished {
    
    func loginDidSucceed() -> Void
    
    func loginDidFailedWithError(error : String) -> Void
    
}

protocol LoginInteractor {
    
    func performLogin(email : String?, password : String?, onLoginFinishedCallback : OnLoginFinished) -> Void
    
    func performFacebookLogin(viewController : UIViewController, onLoginFinishedCallback : OnLoginFinished) -> Void
    
    func performGoogleLogin(viewController : UIViewController, onLoginFinishedCallback : OnLoginFinished) -> Void
    
}



class LoginInteractorImpl: LoginInteractor {
    
    func performFacebookLogin(viewController: UIViewController, onLoginFinishedCallback: OnLoginFinished) {
        
        let fbManager = FacebookLoginManager.sharedInstance
        
        fbManager.performLogin(viewController: viewController) { (userModel, errorMessage) in
            
            // save to defaults
            
            if let user = userModel {
                
                UserModel.saveUserToLocalStorage(user: user)
                
                onLoginFinishedCallback.loginDidSucceed()
                
            } else {
                onLoginFinishedCallback.loginDidFailedWithError(error: errorMessage!)
            }
            
        }
    }
    
    func performGoogleLogin(viewController: UIViewController, onLoginFinishedCallback: OnLoginFinished) {
        
        let googleLoginManager = GoogleLoginManager.sharedInstance

        googleLoginManager.signIn(controller: viewController) { (userModel, error) in
            
            if let user = userModel {
                
                UserModel.saveUserToLocalStorage(user: user)
                
                onLoginFinishedCallback.loginDidSucceed()
                
            } else {
                onLoginFinishedCallback.loginDidFailedWithError(error: error!)
            }
        }
        
    }
    
    
    
    func performLogin(email: String?,password: String?, onLoginFinishedCallback: OnLoginFinished) {
        
        if email == nil || email?.count == 0 || password == nil || password?.count == 0 {
            
            onLoginFinishedCallback.loginDidFailedWithError(error: "Error in validating credentials")
        } else {
            
            // Simulating network activity
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                onLoginFinishedCallback.loginDidSucceed()
            }
        }
    }
    

    
}
