//
//  GPBViewController.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

import RxSwift
import Toaster

class ViewController: UIViewController {
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapGesture()
    }
    
    func addTapGesture() -> Void {
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.dimissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dimissKeyboard() -> Void {
        
        self.view.endEditing(true)
    }
    
    func showMessage( message:String) -> Void {
        
        Toast(text: message).show()
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
