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

    init(view: LoginViewInterface) {
        self.view = view
    }

    func didSelectLoginAction(email: String?, password: String?) {
        guard email != nil, password != nil else {
            view.showEmptyError()
            return
        }
    }
}

// MARK: private
private extension LoginPresenter { }
