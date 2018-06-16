//
//  SignupViewModel.swift
//  Github
//
//  Created by myMac on 16/06/18.
//  Copyright © 2018 Love. All rights reserved.
//

import RxSwift
import RxCocoa

struct SigninViewModel {
    
    let userName = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
 
    var isValid : Observable<Bool> {
        return Observable.combineLatest(userName.asObservable(), password.asObservable()) { email, password in
            email.count > 0 && password.count > 0
        }
    }
}
