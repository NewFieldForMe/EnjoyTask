//
//  RegisterWireframe.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class RegisterWireframe: RegisterWireframeInterface {
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createModule() -> UIViewController {
        let vc = buildViewController()
        let wireframe = RegisterWireframe(viewController: vc)
        let presenter = RegisterPresenter(view: vc, wireframe: wireframe)
        vc.presenter = presenter
        return vc
    }

    func dismissBackToLogin() {
        viewController.dismiss(animated: true, completion: nil)
    }
}

private extension RegisterWireframe {
    static func buildViewController() -> RegisterViewController {
        return self.mainstoryboard.instantiateViewController(identifier: "registerViewController") as! RegisterViewController
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
