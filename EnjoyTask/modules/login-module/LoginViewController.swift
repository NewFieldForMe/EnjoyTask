//
//  LoginViewController.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            setPlaceholderLabelColor(emailTextField)
        }
    }

    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            setPlaceholderLabelColor(passwordTextField)
        }
    }
}

private extension LoginViewController {
    func setPlaceholderLabelColor(_ textField: UITextField) {
        let iVar = class_getInstanceVariable(UITextField.self, "_placeholderLabel")!
        let placeholderLabel = object_getIvar(textField, iVar) as! UILabel
        placeholderLabel.textColor = .white
    }
}
