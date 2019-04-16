//
//  AuthenticationCoordinator.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//
import UIKit

protocol AuthenticationCoordinatorDelegate:class {
    func coordinatorDidAuthenticate(coordinator:AuthenticationCoordinator)
}

final class AuthenticationCoordinator:Coordinator {

    weak var delegate:AuthenticationCoordinatorDelegate?
    let navigationController:UINavigationController
    let loginViewController:LoginViewController

    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
        let viewModel = LoginViewModel()
        self.loginViewController = LoginViewController(viewModel:viewModel)
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {
        showLoginViewController()
    }

    func showLoginViewController() {
        loginViewController.delegate = self
        navigationController.show(loginViewController, sender: self)
    }

    func showSignupViewController(){
        let viewModel = SignupViewModel()
        let signup = SignupViewController(viewModel:viewModel)
        signup.delegate = self
        navigationController.show(signup, sender: self)
    }

    func showPasswordViewController(){
        let viewModel = PasswordViewModel()
        let password = PasswordViewController(viewModel:viewModel)
        password.delegate = self
        navigationController.show(password, sender: self)
    }
}

extension AuthenticationCoordinator : LoginViewControllerDelegate {

    func didSuccessfullyLogin() {
        print(navigationController.children)
        delegate?.coordinatorDidAuthenticate(coordinator: self)
    }

    func didChooseSignup() {
        showSignupViewController()
    }
}

extension AuthenticationCoordinator : SignupViewControllerDelegate {
    func didCompleteSignup() {
        showPasswordViewController()
    }
}

extension AuthenticationCoordinator : PasswordViewControllerDelegate {
    func didSignupWithEmailAndPassword(email: String, passowrd: String) {
        delegate?.coordinatorDidAuthenticate(coordinator: self)
    }
}
