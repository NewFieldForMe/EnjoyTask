//
//  EditTaskViewController.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/10/21.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit
import Firebase

class EditTaskViewController: UIViewController {
    @IBAction func tapRegisterButton(_ sender: UIButton) {
        /// Todo: 試しに登録できるか確認しただけなので、Presenter以降のレイヤーに移動する
        let db = Firestore.firestore()
        let currentUserId = AuthInteractor().currentUser?.uid
        db.collection("users").document(currentUserId!)
            .collection("tasks").addDocument(data: [
                "title": "hoge"
            ])
    }
}
