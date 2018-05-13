//
//  GoogleLoginManager.swift
//  GoPlayBook
//
//  Created by myMac on 29/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

import GoogleSignIn

class GoogleLoginManager: NSObject, GIDSignInUIDelegate, GIDSignInDelegate {
    
    static let sharedInstance = GoogleLoginManager()
    private override init() {}

    var viewController: UIViewController?
    var completionHandler: ((_ user: UserModel?, _ error:String?) -> Void)?

    func signIn(controller:UIViewController, completion: @escaping (_ user: UserModel?, _ error:String?) -> Void) -> Void {
        
        self.viewController = controller
        self.completionHandler = completion
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func logOutUser() -> Void {
        GIDSignIn.sharedInstance().signOut()
    }
    
    //MARK:Google SignIn Delegate
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        
        self.viewController?.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if (error == nil) {
            
            var userProfile:[String:String] = [:]
            
            let idToken = user.authentication.idToken // Safe to send to the server
            
            userProfile[UserModel.Keys.firstName] = user.profile.name
            userProfile[UserModel.Keys.userId] = user.userID
            userProfile[UserModel.Keys.email] = user.profile.email
            userProfile[UserModel.Keys.userType] = "g"
            
            if user.profile.hasImage {
                
                let imageURL = user.profile.imageURL(withDimension: 100)
                
                if let string = imageURL {
                    userProfile[UserModel.Keys.picture] = string.absoluteString
                }
            }
            
            let userModel = UserModel(dictionary: userProfile)
            
            self.completionHandler!(userModel, nil)
            
        }
        else {
            print("error in sign in")
            self.completionHandler!(nil, error.localizedDescription)
        }
    }
}
