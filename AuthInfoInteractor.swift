//
//  AuthInfoInteractor.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/09/27.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import Foundation

struct AuthInfoInteractor: AuthInfoUseCase {
    func validate(emailAddress: String?, password: String?, onSuccess: @escaping (_ authInfo: AuthInfoEntity) -> (), onError: @escaping () -> ()) {
        
    }
}
