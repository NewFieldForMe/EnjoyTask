//
//  LoginPresenterTests.swift
//  EnjoyTaskTests
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import XCTest
import Cuckoo
@testable import EnjoyTask

/// ** TODOs **
/// - OK: emailとpasswordを空でloginアクションを実行したらemptyエラーが発生する
/// - OK: emailとpasswordに何かいれてloginアクションを実行したらemptyエラーが発生しない
class LoginPresenterTests: XCTestCase {
    // System under test
    var sut: LoginPresenter!
    var mockView: MockLoginViewInterface!
    var mockWireframe: MockLoginWireframeInterface!
    var mockAuthUseCase: MockAuthUseCase!

    override func setUp() {
        mockView = MockLoginViewInterface()
        mockWireframe = MockLoginWireframeInterface()
        mockAuthUseCase = MockAuthUseCase()
        stub(mockView) { stub in
            when(stub.showEmptyError()).thenDoNothing()
        }
        stub(mockAuthUseCase) { stub in
            when(stub.login(emailAddress: any(), password: any(), onSuccess: any(), onError: any())).thenDoNothing()
        }
        sut = LoginPresenter(view: mockView, wireframe: mockWireframe, authUseCase: mockAuthUseCase)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// emailアドレスとパスワードが空だった時
    ///   - バリデーションエラーになる
    func testDidSelectLoginAction_withEmptyEmailAddress_And_Password() {
        sut.didSelectLoginAction(email: nil, password: nil)
        verify(mockView, times(1)).showEmptyError()

        sut.didSelectLoginAction(email: "email", password: nil)
        verify(mockView, times(2)).showEmptyError()

        sut.didSelectLoginAction(email: nil, password: "password")
        verify(mockView, times(3)).showEmptyError()
    }

    /// emailアドレスとパスワードが空でない時
    ///   - バリデーションエラーにならない
    func testDidSelectLoginAction_withNotEmptyEmailAddress_And_Password() {
        sut.didSelectLoginAction(email: "email", password: "password")
        verify(mockView, times(0)).showEmptyError()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
