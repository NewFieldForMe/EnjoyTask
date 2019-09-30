//
//  RegisterPresenter.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

class RegisterPresenter: RegisterPresenterInterface {
    weak var view: RegisterViewInterface!
    let wireframe: RegisterWireframeInterface
    let authUseCase: AuthUseCase

    init(view: RegisterViewInterface, wireframe: RegisterWireframeInterface, authUseCase: AuthUseCase) {
        self.view = view
        self.wireframe = wireframe
        self.authUseCase = authUseCase
    }

    func didSelectRegisterAction(email: String?, password: String?) {
        guard let email = email, let password = password else {
            view.showValidationError()
            return
        }
        authUseCase.createUser(emailAddress: email, password: password, onSuccess: { }, onError: {

        })
    }

    func didSelectBackToLoginAction() {
        wireframe.dismissBackToLogin()
    }
}

// MARK: private
private extension RegisterPresenter { }
