//
//  AuthInteractor.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/27.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation
import FirebaseAuth

struct AuthInteractor: AuthUseCase {
    func validate(emailAddress: String?, password: String?, onSuccess: @escaping () -> (), onError: @escaping () -> ()) {
        // Todo: implementation
    }

    func createUser(emailAddress: String?, password: String?, onSuccess: @escaping () -> (), onError: @escaping () -> ()) {
        guard let emailAddress = emailAddress, let password = password else { return }
        Auth.auth().createUser(withEmail: emailAddress, password: password) { (result, error) in
            if let error = error {
                let authError = AuthErrorCode.init(rawValue: error._code)
                print(authError)
                onError()
                return
            }
            onSuccess()
        }
    }
}
