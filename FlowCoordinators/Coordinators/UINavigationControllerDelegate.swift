//
//  UINavigationControllerDelegate.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/24/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

final class NavigationControllerDelegate: NSObject {

    fileprivate var animator: AnimatedTransitioning!
    fileprivate var interactionController: UIPercentDrivenInteractiveTransition?

    init(animator: AnimatedTransitioning = NavigationAnimator()) {
        self.animator = animator
    }

}

extension NavigationControllerDelegate : UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.operation = operation
        return animator
    }

    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}
