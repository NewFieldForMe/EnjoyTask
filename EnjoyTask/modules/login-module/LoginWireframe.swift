//
//  LoginWireframe.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class LoginWireframe: LoginWireframeInterface {
    static func createModule() -> LoginViewController {
        // Todo: setup presenter
        return viewController
    }
}

private extension LoginWireframe {
    static var viewController: LoginViewController {
        return self.mainstoryboard.instantiateViewController(identifier: "loginViewController") as! LoginViewController
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
