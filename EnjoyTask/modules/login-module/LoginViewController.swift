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

    @IBAction func tapLoginButton(_ sender: UIButton) {
        presenter.didSelectLoginAction(email: emailTextField.text, password: passwordTextField.text)
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
    func showNetworkError() {
        let alert = UIAlertController(title: "エラー", message: "通信環境の良いところでもう一度お試しください。", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }

    func showLoadScreen() {
        // Todo: implementation
    }

    func hideLoadScreen() {
        // Todo: implementation
    }

    func showEmptyError() {
        let alert = UIAlertController(title: "エラー", message: "メールアドレスとパスワードを正しく入力してください。", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }

    func showLoginError() {
        let alert = UIAlertController(title: "エラー", message: "ログインに失敗しました。メールアドレスとパスワードを見直して、もう一度お試しください。", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
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
