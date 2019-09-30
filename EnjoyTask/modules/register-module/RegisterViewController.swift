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

    @IBAction func tapRegisterButton(_ sender: UIButton) {
        presenter.didSelectRegisterAction(email: emailTextField.text, password: passwordTextField.text)
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        presenter.didSelectBackToLoginAction()
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

private extension RegisterViewController {
    func setPlaceholderLabelColor(_ textField: UITextField) {
        let iVar = class_getInstanceVariable(UITextField.self, "_placeholderLabel")!
        let placeholderLabel = object_getIvar(textField, iVar) as! UILabel
        placeholderLabel.textColor = .white
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
