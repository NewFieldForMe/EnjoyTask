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
        let authUseCase =  AuthInteractor()
        let presenter = TaskListPresenter(view: vc, wireframe: wireframe, authUseCase: authUseCase)
        vc.presenter = presenter
        return vc
    }

    func showLoginViewController() {
//        viewController.dismiss(animated: true, completion: nil)
        RootRouter.setRootViewController()
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
