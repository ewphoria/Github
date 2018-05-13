//
//  HomePresenter.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

protocol HomePresenter {
    
    func getUserData() -> Void
    func submitSportsAadharCard( email : String?, password : String?) -> Void
    func logout() -> Void
    
    init(view : HomeView, interactor : HomeInteractor)
}

class HomePresenterImpl: HomePresenter, HomeInteractorDelegate {
    func submitSportsAadharCard(email: String?, password: String?) {}
    
    func onUserDetailsFetched(user: UserModel, error: String) {}
    
    
    var homeInteractor: HomeInteractor?
    
    var homeView: HomeView?
    
    required init(view: HomeView, interactor: HomeInteractor) {
        
        self.homeView = view
        self.homeInteractor = interactor
    }
    
    func getUserData() {
        
        self.homeView?.showLoadingIndicator()
        self.homeInteractor?.getUserInformation(homeIteractorDelegate: self)
        
    }
    
    func onAadharCardDetailsSaved() -> Void {
        
    }
    
    func onAadharCardDetailsSaveFailedWithError(error : String) -> Void {
        
    }
    
    func onUserDetailsFetched(user : UserModel?, error: String?) -> Void {
        
        if let idIntegerValue = user?.id?.count {
            
            if idIntegerValue > 0 {
                self.homeView?.setUserProfile(user: user!)
            }
        }
         else {
            self.homeView?.showMessage(error: error!)
        }
        
        self.homeView?.hideLoadingIndicator()
    }
    
    func logout() {
        self.homeInteractor?.logoutUser(homeIteractorDelegate: self)
    }
    
    func userLoggedOut() {
        
        self.homeView?.dimissHomeView()
        
    }
}
