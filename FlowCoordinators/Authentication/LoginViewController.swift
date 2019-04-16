//
//  LoginviewControllerViewController.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate:class {
    func didSuccessfullyLogin()
    func didChooseSignup()
}

protocol LoginViewModelType { }

struct LoginViewModel: LoginViewModelType { }

final class LoginViewController: UIViewController {

    weak var delegate: LoginViewControllerDelegate?
    let viewModel: LoginViewModelType

    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("deallocing \(self)")
    }

    @IBAction func loginAction(_ sender: Any) {
        delegate?.didSuccessfullyLogin()
    }

    @IBAction func signupAction(_ sender: Any) {
        delegate?.didChooseSignup()
    }
}
