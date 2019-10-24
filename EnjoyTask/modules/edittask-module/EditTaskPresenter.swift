//
//  EditTaskPresenter.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/10/21.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

class EditTaskPresenter: EditTaskPresenterInterface {
    let wireframe: EditTaskWireframeInterface
    let tasksUseCase: TasksUseCase
    let editTaskCompletion: (() -> Void)?

    init(tasksUseCase: TasksUseCase, wireframe: EditTaskWireframeInterface, editTaskCompletion: (() -> Void)?) {
        self.tasksUseCase = tasksUseCase
        self.wireframe = wireframe
        self.editTaskCompletion = editTaskCompletion
    }

    func didSelectAddTaskAction(title: String) {
        let task = Task(title: title)
        tasksUseCase.addTask(task)
        editTaskCompletion?()
        wireframe.dismiss()
    }
}
