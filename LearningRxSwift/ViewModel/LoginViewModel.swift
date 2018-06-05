//
//  LoginViewModel.swift
//  LearningRxSwift
//
//  Created by Danilo Ricardo Dias Pena on 04/06/2018.
//  Copyright © 2018 Danilo Pena. All rights reserved.
//

import UIKit
import RxSwift

struct LoginViewModel {
    private var emailTxt = Variable<String>("")
    private var passwordTxt = Variable<String>("")

    var isValid : Observable<Bool> {
        return Observable.combineLatest(emailTxt.asObservable(), passwordTxt.asObservable()) { email, password in
            self.emailValidation() && password.count >= 3
        }
    }
    
    private func emailValidation () -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailTxt.value)
    }
}
