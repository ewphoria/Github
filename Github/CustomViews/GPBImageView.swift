//
//  GPBImageView.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class GPBImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 1 {
        didSet {
            configureUI()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
    
    func setImageWithURL(urlString: String, placeHolder:UIImage?) -> Void {
        
        if let url = URL.init(string: urlString) {
            
            sd_setImage(with: url, placeholderImage: placeHolder)
        }
        

        
    }
    
    
}
