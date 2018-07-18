//
//  AppCoordinator.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

class Coordinator { }

final class AppCoordinator {

    fileprivate var isLoggedIn = false
    fileprivate let navigationController:UINavigationController
    fileprivate var childCoordinators = [Coordinator]()

    init(with navigationController:UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {
        if isLoggedIn {
            showProfile()
        } else {
            showAuthentication()
        }
    }

    fileprivate func showProfile() {
        let profileFlowCoordinator = ProfileFlowCoordinator(navigationController: navigationController)
        profileFlowCoordinator.delegate = self
        profileFlowCoordinator.start()
        childCoordinators.append(profileFlowCoordinator)
    }

    fileprivate func showAuthentication() {
        let authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController)
        authenticationCoordinator.delegate = self
        authenticationCoordinator.start()
        childCoordinators.append(authenticationCoordinator)
    }

}

extension AppCoordinator : AuthenticationCoordinatorDelegate {

    func coordinatorDidAuthenticate(coordinator:AuthenticationCoordinator) {
        removeCoordinator(coordinator: coordinator)
        showProfile()
    }

    fileprivate func removeCoordinator(coordinator:Coordinator) {
        let arr = childCoordinators.filter {$0 !== coordinator}
        childCoordinators = arr
    }
}

extension AppCoordinator : ProfileFlowCoordinatorDelegate {
    //TODO:
}
