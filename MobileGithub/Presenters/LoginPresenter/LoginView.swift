//
//  LoginView.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

protocol LoginView {
    
    func showMessage(error : String) -> Void
    
    func presentHomeView() -> Void
    
    func showLoadingIndicator() -> Void
    
    func hideLoadingIndicator() -> Void
    
}
