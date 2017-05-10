//
//  ProfileFlowController.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//
import UIKit

protocol ProfileFlowCoordinatorDelegate:class { }

final class ProfileFlowCoordinator:Coordinator {

    fileprivate let navigationController:UINavigationController
    fileprivate let profileViewController:ProfileViewController
    fileprivate let navigationDelegate:NavigationControllerDelegate?

    fileprivate var isProfileViewContoller:Bool {
        guard let _ = navigationController.topViewController?.isKind(of: ProfileViewController.self) else { return false }
        return true
    }

    weak var delegate:ProfileFlowCoordinatorDelegate?

    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
        navigationDelegate = NavigationControllerDelegate()
        self.navigationController.delegate = navigationDelegate
        let viewModel = ProfileViewModel()
        self.profileViewController = ProfileViewController(viewModel:viewModel)
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {

        profileViewController.delegate = self

        guard let topViewController = navigationController.topViewController else {
            return navigationController.setViewControllers([profileViewController], animated: false)
        }

        //simple animation function
        profileViewController.view.frame = topViewController.view.frame
        UIView.transition(from:topViewController.view , to: profileViewController.view, duration: 0.50, options: .transitionCrossDissolve) {[unowned self] (finished) in
            self.navigationController.setViewControllers([self.profileViewController], animated: false)
        }

    }

    fileprivate func showFollowingViewController() {

        let viewModel = FollowingViewModel()
        let following = FollowingViewController(viewModel:viewModel)
        following.delegate = self

        if isProfileViewContoller {
            navigationController.show(following, sender: self)
        }
    }

    fileprivate func showFollowersViewController() {

        let viewModel = FollowersViewModel()
        let followers = FollowersViewController(viewModel:viewModel)
        followers.delegate = self

        if isProfileViewContoller {
            navigationController.show(followers, sender: self)
        }

    }

    fileprivate func showSettingsViewController() {

        let viewModel = SettingsViewModel()
        let settings = SettingsViewController(viewModel:viewModel)
        settings.delegate = self
        navigationController.showDetailViewController(settings, sender: self)

    }

    fileprivate func popViewController() {
        navigationController.popViewController(animated: true)
    }

    fileprivate func dismissModal() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}

extension ProfileFlowCoordinator : ProfileViewControllerDelegate {

    func didSelectSettingsAction() {
        showSettingsViewController()
    }

    func didSelectFollowingAction() {
        showFollowingViewController()
    }

    func didSelectFollowersAction() {
        showFollowersViewController()
    }
}

extension ProfileFlowCoordinator : FollowingDelegate {
    //TODO:
}

extension ProfileFlowCoordinator : FollowersDelegate {
    //TODO:
}

extension ProfileFlowCoordinator : SettingsDelegate {
    func dismissSettingsViewController() {
        dismissModal()
    }
}
