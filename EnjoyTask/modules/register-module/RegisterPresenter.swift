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

    init(view: RegisterViewInterface) {
        self.view = view
    }

    func didSelectRegisterAction(email: String?, password: String?) {
        guard email != nil, password != nil else {
            view.showValidationError()
            return
        }
    }
}

// MARK: private
private extension RegisterPresenter { }
