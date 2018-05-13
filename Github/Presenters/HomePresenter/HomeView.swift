//
//  HomeView.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

protocol HomeView {
    
    func setUserProfile(user : UserModel) -> Void
    
    func showLoadingIndicator() -> Void
    
    func hideLoadingIndicator() -> Void
    
    func dimissHomeView() -> Void
    
    func showMessage(error : String) -> Void

}
