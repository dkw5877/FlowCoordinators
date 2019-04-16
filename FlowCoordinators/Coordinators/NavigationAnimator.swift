//
//  Animator.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/24/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

/**
  extension on required UIViewControllerAnimatedTransitioning protocol to add properties to support spring animation
 */
protocol AnimatedTransitioning: UIViewControllerAnimatedTransitioning {

    var operation: UINavigationController.Operation { get set }
    var dampening: CGFloat { get set }
    var velocity: CGFloat { get set }
}

/**
    Custom Animator class to override the default push and pop animations with a custom shrink animation.
 */
final class NavigationAnimator: NSObject, AnimatedTransitioning {

    var operation: UINavigationController.Operation = .none
    var dampening: CGFloat = 1.0
    var velocity: CGFloat = 1.0

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        switch operation {
        case .push:
            swapAnimation(transitionContext: transitionContext)
        case .pop:
            swapAnimation(transitionContext: transitionContext)
        case .none: break
        @unknown default:
            fatalError()
        }
    }

    fileprivate func swapAnimation(transitionContext: UIViewControllerContextTransitioning) {

        guard let toViewController = transitionContext.viewController(forKey: .to), let fromViewController = transitionContext.viewController(forKey: .from) else { return }

        transitionContext.containerView.addSubview(toViewController.view)
        let scaleX: CGFloat = 0.9
        let scaleY: CGFloat = 0.9

        //this kinda sucks that we have to adjust the frame size when loading from xib
        toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
        toViewController.view.transform = CGAffineTransform.init(scaleX: scaleX, y: scaleY)
        toViewController.view.alpha = 0
        let duration = transitionDuration(using: transitionContext)

        UIView.animate(withDuration:duration , delay: 0, usingSpringWithDamping: dampening, initialSpringVelocity: velocity, options: .curveEaseInOut, animations: {
            fromViewController.view.transform = CGAffineTransform.init(scaleX: scaleX, y: scaleY)
            fromViewController.view.alpha = 0
            toViewController.view.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            toViewController.view.alpha = 1
        }, completion: { (_) in
            fromViewController.view.transform = .identity
            toViewController.view.transform = .identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
