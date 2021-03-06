//
//  EditTaskInterfaces.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/10/21.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

protocol EditTaskViewInterface: class { }
protocol EditTaskPresenterInterface: class {
    func didSelectAddTaskAction(title: String)
}

protocol EditTaskWireframeInterface: class {
    func dismiss()
}
