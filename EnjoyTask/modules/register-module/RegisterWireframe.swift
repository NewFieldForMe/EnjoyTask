//
//  RegisterWireframe.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class RegisterWireframe: RegisterWireframeInterface {
    static func createModule() -> UIViewController {
        // Todo: setup presenter
        return viewController
    }
}

private extension RegisterWireframe {
    static var viewController: RegisterViewController {
        return self.mainstoryboard.instantiateViewController(identifier: "registerViewController") as! RegisterViewController
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
