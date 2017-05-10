//
//  ProfileViewController.swift
//  iOSPracticeAppSwift
//
//  Created by user on 4/20/17.
//  Copyright © 2017 someCompanyNameHere. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate:class  {
    func didSelectSettingsAction()
    func didSelectFollowingAction()
    func didSelectFollowersAction()
}

protocol ProfileViewModelType { }

struct ProfileViewModel:ProfileViewModelType { }

final class ProfileViewController: UIViewController {

    weak var delegate:ProfileViewControllerDelegate?
    let viewModel:ProfileViewModelType

    init(viewModel:ProfileViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        let blue = UIColor(colorLiteralRed: 81/255, green: 123/255, blue: 169/255, alpha: 1.0)
        let midnight = UIColor(colorLiteralRed: 25/255, green: 25/255, blue: 112/255, alpha: 1.0)
        gradient.colors = [blue.cgColor, midnight.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
    

    @IBAction func settingsAction(_ sender: Any) {
        delegate?.didSelectSettingsAction()
    }

    @IBAction func followingAction(_ sender: Any) {
        delegate?.didSelectFollowingAction()
    }

    @IBAction func followersAction(_ sender: Any) {
        delegate?.didSelectFollowersAction()
    }

}
