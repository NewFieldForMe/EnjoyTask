//
//  LoginViewController.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var presenter: LoginPresenterInterface!

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.accessibilityIdentifier = AccessibilityIdentifiers.Login.emailTextField
            setPlaceholderLabelColor(emailTextField)
        }
    }

    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.accessibilityIdentifier = AccessibilityIdentifiers.Login.passwordTextField
            setPlaceholderLabelColor(passwordTextField)
        }
    }

    @IBAction func tapMoveToRegisterButton(_ sender: UIButton) {
        presenter.didSelectMoveToRegisterAction()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )

        view.addGestureRecognizer(tap)
    }
}

extension LoginViewController: LoginViewInterface {
    func showLoadScreen() {
        // Todo: implementation
    }

    func hideLoadScreen() {
        // Todo: implementation
    }

    func showEmptyError() {
        // Todo: implementation
    }

    func showLoginError() {
        // Todo: implementation
    }
}

private extension LoginViewController {
    func setPlaceholderLabelColor(_ textField: UITextField) {
        let iVar = class_getInstanceVariable(UITextField.self, "_placeholderLabel")!
        let placeholderLabel = object_getIvar(textField, iVar) as! UILabel
        placeholderLabel.textColor = .white
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
