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

    init(tasksUseCase: TasksUseCase, wireframe: EditTaskWireframeInterface) {
        self.tasksUseCase = tasksUseCase
        self.wireframe = wireframe
    }

    func didSelectAddTaskAction(title: String) {
        let task = Task(title: title)
        tasksUseCase.addTask(task)
        wireframe.dismiss()
    }
}
