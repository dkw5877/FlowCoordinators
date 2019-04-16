//
//  PasswordViewController.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

protocol PasswordViewControllerDelegate:class {
    func didSignupWithEmailAndPassword(email: String, passowrd: String)
}

protocol PasswordViewModelType { }

struct PasswordViewModel: PasswordViewModelType { }

final class PasswordViewController: UIViewController {

    weak var delegate: PasswordViewControllerDelegate?
    let viewModel: PasswordViewModelType

    init(viewModel: PasswordViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("deallocing \(self)")
    }

    @IBAction func signupAction(_ sender: Any) {
        delegate?.didSignupWithEmailAndPassword(email: "email", passowrd: "password")
    }

}
