//
//  RootRouter.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class RootRouter {
    static func rootNavigationController() -> UIViewController {
        let loginViewController = LoginWireframe.createModule()
        return loginViewController
    }
}
