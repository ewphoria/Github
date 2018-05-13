//
//  HomeInteractor.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

protocol HomeInteractorDelegate {
    
    func onAadharCardDetailsSaved() -> Void
    
    func onAadharCardDetailsSaveFailedWithError(error : String) -> Void
    
    func onUserDetailsFetched(user : UserModel?, error: String?) -> Void
    
    func userLoggedOut() -> Void
    
}

protocol HomeInteractor {
    
    func saveSportsAadharCard( email : String?, password : String?, homeIteractorDelegate: HomeInteractorDelegate) -> Void
    
    func getUserInformation(homeIteractorDelegate: HomeInteractorDelegate)
    
    func logoutUser(homeIteractorDelegate: HomeInteractorDelegate) -> Void
    
}

class HomeInteractorImpl: HomeInteractor {
    
    func saveSportsAadharCard(email: String?, password: String?, homeIteractorDelegate onDetailsSavedOperationCompleted: HomeInteractorDelegate) {
    }
    
    func getUserInformation(homeIteractorDelegate: HomeInteractorDelegate) {

        
        let userModel = UserModel.getUserFromLocalStorage()
        
        if userModel != nil {
            
            homeIteractorDelegate.onUserDetailsFetched(user: userModel!, error: nil)
        } else {
            homeIteractorDelegate.onUserDetailsFetched(user: nil, error: "User does not exists")
        }
        
    }
    
    func logoutUser(homeIteractorDelegate: HomeInteractorDelegate) {
        
        let userModel = UserModel.getUserFromLocalStorage()
        
        if userModel?.userType == "f" {
            
            let fbManager = FacebookLoginManager.sharedInstance
            
            fbManager.logout()
            
        } else {
            
            let googleLoginManager = GoogleLoginManager.sharedInstance
            
            googleLoginManager.logOutUser()
            
        }
     
        UserModel.removeUser()
        
        homeIteractorDelegate.userLoggedOut()
    }
}
