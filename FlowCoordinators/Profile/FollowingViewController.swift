//
//  FollowingViewController.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

protocol FollowingDelegate:class { }

protocol FollowingViewModelType { }

struct FollowingViewModel:FollowingViewModelType { }

final class FollowingViewController: UIViewController {

    weak var delegate:FollowingDelegate?
    let viewModel:FollowingViewModelType

    init(viewModel:FollowingViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Following"
    }

}
