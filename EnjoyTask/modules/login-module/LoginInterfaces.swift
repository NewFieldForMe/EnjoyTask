//
//  LoginInterfaces.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

protocol LoginViewInterface: class {
    func showLoadScreen()
    func hideLoadScreen()
    func showEmptyError()
    func showLoginError()
}

protocol LoginPresenterInterface: class {
    func didSelectLoginAction(email: String?, password: String?)
}

protocol LoginWireframeInterface: class {
    func createModule() -> LoginViewController
}
