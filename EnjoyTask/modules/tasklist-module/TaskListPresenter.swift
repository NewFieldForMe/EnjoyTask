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
    let taskUseCase: TasksUseCase

    init(view: TaskListViewInterface, wireframe: TaskListWireframeInterface, authUseCase: AuthUseCase, taskUseCase: TasksUseCase) {
        self.view = view
        self.wireframe = wireframe
        self.authUseCase = authUseCase
        self.taskUseCase = taskUseCase
    }

    func loadTasks() {
        taskUseCase.tasks { tasks, error in
            print(tasks)
            print(error)
        }
    }

    func didSelectLogoutAction() {
        authUseCase.logout()
        wireframe.showLoginViewController()
    }

    func didSelectMoveToAddTaskAction() {
        wireframe.showAddTaskViewController()
    }
}
