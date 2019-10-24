//
//  TaskListInterfaces.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/30.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

protocol TaskListViewInterface: class {
    func reloadTableView()
}

protocol TaskListPresenterInterface: class {
    func didSelectLogoutAction()
    func didSelectMoveToAddTaskAction()
    func loadTasks()
    var tasks: [Task]? { get }
}

protocol TaskListWireframeInterface: class {
    func showLoginViewController()
    func showAddTaskViewController(editTaskCompletion: (() -> Void)?)
}
