//
//  LoginPresenter.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresenterInterface {
    weak var view: LoginViewInterface!
    let wireframe: LoginWireframeInterface
    let authUseCase: AuthUseCase

    init(view: LoginViewInterface, wireframe: LoginWireframeInterface, authUseCase: AuthUseCase) {
        self.view = view
        self.wireframe = wireframe
        self.authUseCase = authUseCase
    }

    func didSelectLoginAction(email: String?, password: String?) {
        guard email != nil, password != nil else {
            view.showEmptyError()
            return
        }
        authUseCase.login(emailAddress: email, password: password, onSuccess: { }, onError: {

        })
    }

    func didSelectMoveToRegisterAction() {
        wireframe.showRegiserViewController()
    }
}

// MARK: private
private extension LoginPresenter { }
