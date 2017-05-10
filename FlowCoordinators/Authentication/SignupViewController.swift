//
//  SignupViewController.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

protocol SignupViewControllerDelegate:class {
    func didCompleteSignup()
}

protocol SignupViewModelType { }

struct SignupViewModel:SignupViewModelType { }

final class SignupViewController: UIViewController {

    weak var delegate:SignupViewControllerDelegate?
    let viewModel:SignupViewModelType

    init(viewModel:SignupViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("deallocing \(self)")
    }

    @IBAction func nextAction(sender:Any){
        delegate?.didCompleteSignup()
    }

}
