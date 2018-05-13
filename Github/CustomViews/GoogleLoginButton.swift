//
//  GoogleLoginButton.swift
//  GoPlayBook
//
//  Created by myMac on 29/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

let kGoogleLoginButtonBackgroundColor = UIColor(displayP3Red: 220/255, green: 63/255, blue: 41/255, alpha: 1)
let kGoogleLoginButtonTintColor = UIColor.white
let kGoogleLoginButtonCornerRadius: CGFloat = 5.0

class GoogleLoginButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = kGoogleLoginButtonBackgroundColor
        self.layer.cornerRadius = kGoogleLoginButtonCornerRadius
        self.tintColor = kGoogleLoginButtonTintColor
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
}
