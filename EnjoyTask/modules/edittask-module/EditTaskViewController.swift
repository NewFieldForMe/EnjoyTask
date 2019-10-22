//
//  EditTaskViewController.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/10/21.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController {
    var presenter: EditTaskPresenterInterface!

    @IBOutlet weak var titleTextField: UITextField!

    @IBAction func tapRegisterButton(_ sender: UIButton) {
        guard let title = titleTextField.text else { return }
        presenter.didSelectAddTaskAction(title: title)
    }
}
