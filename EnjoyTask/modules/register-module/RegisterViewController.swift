//
//  RegisterViewController.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    var presenter: RegisterPresenterInterface!

    @IBAction func tapBackButton(_ sender: UIButton) {
        presenter.didSelectBackToLoginAction()
    }
}

extension RegisterViewController: RegisterViewInterface {
    func showLoadScreen() {
        // Todo: Implementation
    }

    func hideLoadScreen() {
        // Todo: Implementation
    }

    func showValidationError() {
        // Todo: Implementation
    }
}
