//
//  GPBButton.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

let kLoginButtonBackgroundColor = "#16A086"
let kLoginButtonTintColor = UIColor.white
let kLoginButtonCornerRadius: CGFloat = 5.0

class GPBButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = UIColor.init(hexString:kLoginButtonBackgroundColor)
        self.layer.cornerRadius = kLoginButtonCornerRadius
        self.tintColor = kLoginButtonTintColor
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
}
