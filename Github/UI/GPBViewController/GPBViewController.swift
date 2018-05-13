//
//  GPBViewController.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class GPBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapGesture()
    }
    
    func addTapGesture() -> Void {
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(GPBViewController.dimissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dimissKeyboard() -> Void {
        
        self.view.endEditing(true)
    }
    
    func showMessage(title:String?, message:String) -> Void {
        
        var defaultAlertTitle = "GoPlayBook"
        
        if let alertTitle = title {
            defaultAlertTitle = alertTitle
        }
        
        let alert = UIAlertController(title: defaultAlertTitle, message: message, preferredStyle: .alert)
        
        let actionDismiss = UIAlertAction(title: "Dimiss", style: .default) { (action:UIAlertAction) in }
        
        alert.addAction(actionDismiss)
        
        self.present(alert, animated: true, completion: nil)

    }

    func hideLoading() -> Void {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func showLoading() -> Void {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        UIApplication.shared.beginIgnoringInteractionEvents()
    }

}
