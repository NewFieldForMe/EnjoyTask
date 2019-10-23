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
    let db = Firestore.firestore()

    func addTask(_ task: Task) {
        // Todo: AuthInteractorをサービス化する
        let currentUserId = AuthInteractor().currentUser?.uid
        db.collection("users").document(currentUserId!)
            .collection("tasks").addDocument(data: [
                "title": task.title
            ])
    }

    func tasks(completion: @escaping ([Task], Error?) -> Void) {
        let currentUserId = AuthInteractor().currentUser?.uid
        db.collection("users").document(currentUserId!)
            .collection("tasks").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion([], error)
                return
            } else {
                let array = querySnapshot!.documents.compactMap { Task(document: $0) }
                completion(array, nil)
            }
        }
    }
}
