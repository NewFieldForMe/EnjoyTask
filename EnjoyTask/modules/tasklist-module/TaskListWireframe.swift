//
//  TaskListWireframe.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/30.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class TaskListWireframe: TaskListWireframeInterface {
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createModule() -> UIViewController {
        let vc = buildViewController()
        let wireframe = TaskListWireframe(viewController: vc)
        let authUseCase = AuthInteractor()
        let taskUseCase = TaskInteractor()
        let presenter = TaskListPresenter(view: vc, wireframe: wireframe, authUseCase: authUseCase, taskUseCase: taskUseCase)
        vc.presenter = presenter
        return vc
    }

    func showLoginViewController() {
//        viewController.dismiss(animated: true, completion: nil)
        RootRouter.setRootViewController()
    }

    func showAddTaskViewController(editTaskCompletion: (() -> Void)?) {
        let vc = EditTaskWireframe.createModule(editTaskCompletion: editTaskCompletion)
        viewController.present(vc, animated: true, completion: nil)
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
