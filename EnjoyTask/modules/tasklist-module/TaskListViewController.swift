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

    @IBOutlet weak var taskListTableView: UITableView! {
        didSet {
            taskListTableView.delegate = self
            taskListTableView.dataSource = self
            taskListTableView.register(UINib(nibName: "TaskListTableViewCell", bundle: nil), forCellReuseIdentifier: "taskListTableViewCell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // show search button and set action
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))
        // add the button to navigationBar
        self.navigationItem.setRightBarButtonItems([logoutButton], animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadTasks()
    }

    @objc func logout() {
        presenter.didSelectLogoutAction()
    }

    @IBAction func tapAddTaskButton(_ sender: UIButton) {
        presenter.didSelectMoveToAddTaskAction()
    }
}

extension TaskListViewController: TaskListViewInterface {
    func reloadTableView() {
        taskListTableView.reloadData()
    }
}

extension TaskListViewController: UITableViewDelegate { }
extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tasks = presenter.tasks else { return 0 }
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskListTableView.dequeueReusableCell(withIdentifier: "taskListTableViewCell", for: indexPath ) as! TaskListTableViewCell

        guard let task = presenter.tasks?[indexPath.row] else { return cell }
        cell.setup(task: task)

        return cell
    }
}
