//
//  FacebookLoginManager.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

import FBSDKLoginKit
import FBSDKCoreKit

class FacebookLoginManager {
    
    static let sharedInstance = FacebookLoginManager()
    private init() {}
    
    private let readPermissions: [ReadPermission] = [ .publicProfile, .email, .userFriends, .custom("user_posts") ]
    
    let loginManager = LoginManager()
    
    func performLogin(viewController: UIViewController!, completion: @escaping (_ user: UserModel?, _ error:String?) -> Void) -> Void {
        
        
        loginManager.logIn(readPermissions: readPermissions, viewController: viewController) {(loginResult)
            
            in
            
            switch loginResult {

            case .success:
                
                if let accessToken = AccessToken.current {
                    
                    let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"id,email,last_name,first_name,picture"], accessToken: accessToken, httpMethod: .GET, apiVersion: .defaultVersion)
                    
                    graphRequest.start { (response: HTTPURLResponse?, result: GraphRequestResult<GraphRequest>) in
                        
                        switch result {
                            
                        case .success(let graphResponse):
                            if var dictionary = graphResponse.dictionaryValue {
                                
                                dictionary["user_type"] = "f"

                                let userModel = UserModel(dictionary: dictionary)
                                completion(userModel,nil)
                                print(dictionary)
                                
                            }
                            break
                            
                        default:
                            print("Facebook request user error")
                            completion(nil,"Some error occured, please try again")

                        }
                    }
                }
                
                break
                
            case .failed(_):
                completion(nil,"Some error occured, please try again")
                    break
            default:
                completion(nil,"Some error occured, please try again")

                break
            }
            
        }
        
    }
    
    
    func logout() -> Void {
        
        loginManager.logOut()
    }

}
