//
//  TransitioningDelegate.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/24/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

final class TransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return nil
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return NavigationAnimator()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return NavigationAnimator()
    }

}
