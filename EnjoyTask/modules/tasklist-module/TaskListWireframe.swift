//
//  TaskListWireframe.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/30.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class TaskListWireframe: TaskListWireframeInterface {
    static func createModule() -> UIViewController {
        return buildViewController()
    }
}

private extension TaskListWireframe {
    static func buildViewController() -> TaskListViewController {
        return self.mainstoryboard.instantiateViewController(identifier: "taskListViewController") as! TaskListViewController
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
