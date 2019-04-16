//
//  FollowersViewController.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

protocol FollowersDelegate:class { }

protocol FollowersViewModelType {
     var title:String { get }
}

struct FollowersViewModel: FollowersViewModelType {
     let title:String = "Followers"
}

final class FollowersViewController: UIViewController {

    weak var delegate: FollowersDelegate?
    let viewModel: FollowersViewModelType

    init(viewModel: FollowersViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
    }
}
