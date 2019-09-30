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
    let authInfoUseCase: AuthInfoUseCase

    init(view: RegisterViewInterface, wireframe: RegisterWireframeInterface, authInfoUseCase: AuthInfoUseCase) {
        self.view = view
        self.wireframe = wireframe
        self.authInfoUseCase = authInfoUseCase
    }

    func didSelectRegisterAction(email: String?, password: String?) {
        guard let email = email, let password = password else {
            view.showValidationError()
            return
        }
        authInfoUseCase.createUser(emailAddress: email, password: password, onSuccess: { }, onError: {

        })
    }

    func didSelectBackToLoginAction() {
        wireframe.dismissBackToLogin()
    }
}

// MARK: private
private extension RegisterPresenter { }
