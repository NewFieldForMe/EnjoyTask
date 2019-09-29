//
//  LoginWireframe.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class LoginWireframe: LoginWireframeInterface {
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createModule() -> UIViewController {
        let vc = buildViewController()
        let wireframe = LoginWireframe(viewController: vc)
        let presenter = LoginPresenter(view: vc, wireframe: wireframe)
        vc.presenter = presenter
        return vc
    }

    func showRegiserViewController() {
        let registerVC = RegisterWireframe.createModule()
        registerVC.modalPresentationStyle = .fullScreen
        registerVC.modalTransitionStyle = .flipHorizontal
        viewController.present(registerVC, animated: true, completion: nil)
    }
}

private extension LoginWireframe {
    static func buildViewController() -> LoginViewController {
        return self.mainstoryboard.instantiateViewController(identifier: "loginViewController") as! LoginViewController
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
