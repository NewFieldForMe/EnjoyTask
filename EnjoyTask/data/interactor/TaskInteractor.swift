//
//  TaskInteractor.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/10/22.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation
import Firebase

struct TaskInteractor: TasksUseCase {
    func addTask(_ task: Task) {
        let db = Firestore.firestore()
        // Todo: AuthInteractorをサービス化する
        let currentUserId = AuthInteractor().currentUser?.uid
        db.collection("users").document(currentUserId!)
            .collection("tasks").addDocument(data: [
                "title": task.title
            ])
    }
}
