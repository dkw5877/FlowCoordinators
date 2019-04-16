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

struct SettingsViewModel: SettingsViewModelType { }

final class SettingsViewController: UIViewController {

    weak var delegate: SettingsDelegate?
    let viewModel: SettingsViewModelType

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init(viewModel: SettingsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.accentColor
        setupImageView()
        setupDismissButton()
    }
    
    private func setupImageView() {
        let image = UIImage(named: "Settings")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    private func setupDismissButton() {
        let button = UIButton(frame: view.bounds)
        button.center = view.center
        button.addTarget(self, action: #selector(dismissViewController(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func dismissViewController(sender:Any) {
        delegate?.dismissSettingsViewController()
    }

}
