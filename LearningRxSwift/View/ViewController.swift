//
//  ViewController.swift
//  LearningRxSwift
//
//  Created by Danilo Ricardo Dias Pena on 01/06/2018.
//  Copyright © 2018 Danilo Pena. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var password : UITextField!
    @IBOutlet weak var informativeLbl : UILabel!
    @IBOutlet weak var enviarBtn : UIButton! {
        didSet {
            enviarBtn.isEnabled = false
        }
    }
    let disposeBag = DisposeBag()
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = email.rx.text.map {$0 ?? "" }.bind(to: loginViewModel.emailTxt)
        _ = password.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordTxt)

        _ = loginViewModel.isValid.bind(to: enviarBtn.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext: { [weak self] isValid in
            self?.informativeLbl.text = isValid ? "Enabled" : "Not enabled"
            self?.informativeLbl.textColor = isValid ? .green : .red
        }).disposed(by: disposeBag)
        
        enviarBtn.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.performSegue(withIdentifier: "sendToTable", sender: self)
            }).disposed(by: disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

