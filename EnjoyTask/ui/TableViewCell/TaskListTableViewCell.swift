//
//  TaskListTableViewCell.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/10/24.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation
import UIKit

class TaskListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?

    func setup(task: Task) {
        titleLabel?.text = task.title
    }
}
