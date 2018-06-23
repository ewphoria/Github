//
//  SignupViewModel.swift
//  Github
//
//  Created by myMac on 17/06/18.
//  Copyright © 2018 Love. All rights reserved.
//

import RxSwift
import RxCocoa
import FirebaseAuth

class SignupViewModel {
    
    typealias SignupCompletionBlock = (_ errorMessage : String?) -> Void
    
    let userName = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    let confirmPassword = BehaviorRelay<String>(value: "")
    
    var isValid : Observable<Bool> {
        return Observable.combineLatest(userName.asObservable(), password.asObservable(),confirmPassword.asObservable()) { [unowned self] email, password, confirmPassword in
            (email.count > 0 && password.count > 0 && confirmPassword.count > 0) && (password == confirmPassword) && self.validateEmail(enteredEmail: self.userName.value)
        }
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    func signUp(completion : @escaping SignupCompletionBlock) -> Void {
        
        Auth.auth().createUser(withEmail: userName.value, password: password.value) { (newUser, error) in
            
            if let er = error?.localizedDescription {
                completion(er)
            } else {
                if let mail = newUser?.email {
                    completion(nil)
                }
            }
        }
    }
    
    
}

