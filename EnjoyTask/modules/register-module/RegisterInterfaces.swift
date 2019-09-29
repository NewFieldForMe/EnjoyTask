//
//  RegisterInterfaces.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

protocol RegisterViewInterface: class {
    func showLoadScreen()
    func hideLoadScreen()
    func showValidationError()
}

protocol RegisterPresenterInterface: class {
    func didSelectRegisterAction(email: String?, password: String?)
    func didSelectBackToLoginAction()
}

protocol RegisterWireframeInterface: class {
    func dismissBackToLogin()
}
