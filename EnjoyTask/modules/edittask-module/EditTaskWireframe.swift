//
//  EditTaskWireframe.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/10/21.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class EditTaskWireframe: EditTaskWireframeInterface {
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createModule(editTaskCompletion: (() -> Void)?) -> UIViewController {
        let vc = buildViewController()
        let taskUseCase = TaskInteractor()
        let wireframe = EditTaskWireframe(viewController: vc)
        vc.presenter = EditTaskPresenter(tasksUseCase: taskUseCase, wireframe: wireframe, editTaskCompletion: editTaskCompletion)
        return vc
    }

    func dismiss() {
        viewController.dismiss(animated: true, completion: nil)
    }
}

private extension EditTaskWireframe {
    static func buildViewController() -> EditTaskViewController {
        return self.mainstoryboard.instantiateViewController(identifier: "editTaskViewController") as! EditTaskViewController
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
