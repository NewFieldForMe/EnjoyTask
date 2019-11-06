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
            emailTextField.addTarget(self, action: #selector(changeRegisterButtonEnabled), for: .editingChanged)
        }
    }

    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.accessibilityIdentifier = AccessibilityIdentifiers.Login.passwordTextField
            setPlaceholderLabelColor(passwordTextField)
            passwordTextField.addTarget(self, action: #selector(changeRegisterButtonEnabled), for: .editingChanged)

        }
    }

    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.layer.cornerRadius = 4
            registerButton.setTitleColor(UIColor.definedBlack, for: .normal)
            registerButton.setTitleColor(UIColor.definedDisabledBlack, for: .disabled)
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

        changeRegisterButtonEnabled()
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

    @objc func changeRegisterButtonEnabled() {
        guard let emailText = emailTextField.text, let passwordText = passwordTextField.text, !emailText.isEmpty && !passwordText.isEmpty else {
            registerButton.isEnabled = false
            return
        }
        registerButton.isEnabled = true
    }
}
