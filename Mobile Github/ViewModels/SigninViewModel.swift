//
//  SignupViewModel.swift
//  Github
//
//  Created by myMac on 16/06/18.
//  Copyright © 2018 Love. All rights reserved.
//

import RxSwift
import RxCocoa
import FirebaseAuth

class SigninViewModel {
    
    let userName = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
 
    var isValid : Observable<Bool> {
        return Observable.combineLatest(userName.asObservable(), password.asObservable()) { email, password in
            email.count > 0 && password.count > 0
        }
    }
    
    func signIn() -> Void {
        Auth.auth().signIn(withEmail: userName.value, password: password.value) { (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if let userName = user?.email {
                    print(userName)
                }
            }
        }
    }


}
