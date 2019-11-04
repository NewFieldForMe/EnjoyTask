//
//  Task.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/10/22.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation
import Firebase

struct Task {
    let title: String
    let createdAt: Date?

    init(title: String, createdAt: Date? = nil) {
        self.title = title
        self.createdAt = createdAt
    }

    init(document: QueryDocumentSnapshot) {
        let data = document.data()
        self.title = data["title"] as! String
        self.createdAt = (data["createdAt"] as! Timestamp).dateValue()
    }
}
