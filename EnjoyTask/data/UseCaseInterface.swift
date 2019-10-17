//
//  UseCaseInterface.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/27.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol AuthUseCase {
    func validate(emailAddress: String?, password: String?, onSuccess: @escaping () -> Void, onError: @escaping () -> Void)
    func createUser(emailAddress: String?, password: String?, onSuccess: @escaping() -> Void, onError: @escaping() -> Void)
    func login(emailAddress: String, password: String, onSuccess: @escaping() -> Void, onError: @escaping(_ authErrorCode: AuthErrorCode?) -> Void)
    func logout()
    var currentUser: User? { get }
}
