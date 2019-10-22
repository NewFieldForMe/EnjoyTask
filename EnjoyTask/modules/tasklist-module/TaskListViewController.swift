//
//  TaskListViewController.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/30.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {
    var presenter: TaskListPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        // show search button and set action
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))
        // add the button to navigationBar
        self.navigationItem.setRightBarButtonItems([logoutButton], animated: true)
    }

    @objc func logout() {
        presenter.didSelectLogoutAction()
    }

    @IBAction func tapAddTaskButton(_ sender: UIButton) {
        presenter.didSelectAddTaskAction()
    }
}

extension TaskListViewController: TaskListViewInterface { }
