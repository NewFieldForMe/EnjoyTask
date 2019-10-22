//
//  TaskListInterfaces.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/30.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

protocol TaskListViewInterface: class { }

protocol TaskListPresenterInterface: class {
    func didSelectLogoutAction()
    func didSelectAddTaskAction()
}

protocol TaskListWireframeInterface: class {
    func showLoginViewController()
    func showAddTaskViewController()
}
