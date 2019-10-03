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
    func showNetworkError()
}

protocol LoginPresenterInterface: class {
    func didSelectLoginAction(email: String?, password: String?)
    func didSelectMoveToRegisterAction()
}

protocol LoginWireframeInterface: class {
    func showRegiserViewController()
    func showTaskListViewController()
}
