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

    init(title: String) {
        self.title = title
    }

    init(document: QueryDocumentSnapshot) {
        let data = document.data()
        self.title = data["title"] as! String
    }
}
