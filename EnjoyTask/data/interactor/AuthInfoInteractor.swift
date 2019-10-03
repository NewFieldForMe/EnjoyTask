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
    func validate(emailAddress: String?, password: String?, onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        // Todo: implementation
    }

    func createUser(emailAddress: String?, password: String?, onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        guard let emailAddress = emailAddress, let password = password else { return }
        Auth.auth().createUser(withEmail: emailAddress, password: password) { (_, error) in
            if let error = error {
                _ = AuthErrorCode.init(rawValue: error._code)
                onError()
                return
            }
            onSuccess()
        }
    }

    func login(emailAddress: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ error: AuthErrorCode?) -> Void) {
        Auth.auth().signIn(withEmail: emailAddress, password: password) { (_, error) in
            if let error = error {
                let errorCode = AuthErrorCode.init(rawValue: error._code)
                onError(errorCode)
                return
            }
            onSuccess()
        }
    }
}
