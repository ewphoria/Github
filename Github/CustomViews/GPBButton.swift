//
//  GPBButton.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
import MaterialComponents.MDCRaisedButton

let kLoginButtonBackgroundColorDefault = "#16A086"
let kLoginButtonBackgroundColorEnabled = UIColor.init(hexString:"#2DAE4C")
let kLoginButtonBackgroundColorDisabled = UIColor.darkGray
let kLoginButtonTintColor = UIColor.white
let kLoginButtonCornerRadius: CGFloat = 5.0

class GPBButton: MDCRaisedButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = UIColor.init(hexString:kLoginButtonBackgroundColorDefault)
        self.layer.cornerRadius = kLoginButtonCornerRadius
        self.tintColor = kLoginButtonTintColor
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        
    }
    
    override open var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? kLoginButtonBackgroundColorEnabled : kLoginButtonBackgroundColorDisabled
        }
    }
    
}
