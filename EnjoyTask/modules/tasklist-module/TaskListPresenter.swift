//
//  TaskListPresenter.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/30.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

class TaskListPresenter: TaskListPresenterInterface {
    weak var view: TaskListViewInterface!
    let wireframe: TaskListWireframeInterface
    let authUseCase: AuthUseCase

    init(view: TaskListViewInterface, wireframe: TaskListWireframeInterface, authUseCase: AuthUseCase) {
        self.view = view
        self.wireframe = wireframe
        self.authUseCase = authUseCase
    }

    func didSelectLogoutAction() {
        authUseCase.logout()
        wireframe.showLoginViewController()
    }

    func didSelectAddTaskAction() {
        wireframe.showAddTaskViewController()
    }
}
