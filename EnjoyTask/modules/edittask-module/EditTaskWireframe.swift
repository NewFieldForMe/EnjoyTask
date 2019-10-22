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

    static func createModule() -> UIViewController {
        let vc = buildViewController()
        return vc
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
