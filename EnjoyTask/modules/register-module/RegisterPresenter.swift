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

    init(view: RegisterViewInterface, wireframe: RegisterWireframeInterface) {
        self.view = view
        self.wireframe = wireframe
    }

    func didSelectRegisterAction(email: String?, password: String?) {
        guard email != nil, password != nil else {
            view.showValidationError()
            return
        }
    }

    func didSelectBackToLoginAction() {
        wireframe.dismissBackToLogin()
    }
}

// MARK: private
private extension RegisterPresenter { }
