//
//  SettingsViewController.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

protocol SettingsDelegate:class {
    func dismissSettingsViewController()
}

protocol SettingsViewModelType { }

struct SettingsViewModel:SettingsViewModelType { }

final class SettingsViewController: UIViewController {

    weak var delegate:SettingsDelegate?
    let viewModel:SettingsViewModelType

    init(viewModel:SettingsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "Settings")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        let button = UIButton(frame: view.bounds)
        button.center = view.center
        button.addTarget(self, action: #selector(dismissViewController(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }

    func dismissViewController(sender:Any) {
        print("dismiss button pressed")
        delegate?.dismissSettingsViewController()
    }

}
