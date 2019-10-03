//
//  LoginPresenterTests.swift
//  EnjoyTaskTests
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import XCTest
import Cuckoo
import FirebaseAuth
@testable import EnjoyTask

/// ** TODOs **
/// - OK: emailとpasswordを空でloginアクションを実行したらemptyエラーが発生する
/// - OK: emailとpasswordに何かいれてloginアクションを実行したらemptyエラーが発生しない
/// - OK: loginアクションでネットワークエラーが発生したら、ネットワークエラー画面が表示される
/// - OK: loginアクションで他のエラーが発生したら、ログインエラー画面が表示される
/// - OK: loginアクションでログインに成功したら、タスク一覧画面に遷移する
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
            when(stub.showNetworkError()).thenDoNothing()
            when(stub.showLoginError()).thenDoNothing()
        }
        stub(mockAuthUseCase) { stub in
            when(stub.login(emailAddress: any(), password: any(), onSuccess: any(), onError: any())).thenDoNothing()
        }
        stub(mockWireframe) { stub in
            when(stub.showTaskListViewController()).thenDoNothing()
            when(stub.showRegiserViewController()).thenDoNothing()
        }
        sut = LoginPresenter(view: mockView, wireframe: mockWireframe, authUseCase: mockAuthUseCase)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// emailアドレスとパスワードが空もしくはnilだった時
    ///   - バリデーションエラーになる
    func testDidSelectLoginAction_withEmptyEmailAddress_And_Password() {
        sut.didSelectLoginAction(email: nil, password: nil)
        verify(mockView, times(1)).showEmptyError()

        sut.didSelectLoginAction(email: "email", password: nil)
        verify(mockView, times(2)).showEmptyError()

        sut.didSelectLoginAction(email: nil, password: "password")
        verify(mockView, times(3)).showEmptyError()

        sut.didSelectLoginAction(email: "", password: "password")
        verify(mockView, times(4)).showEmptyError()

        sut.didSelectLoginAction(email: "email", password: "")
        verify(mockView, times(5)).showEmptyError()

        sut.didSelectLoginAction(email: "", password: "")
        verify(mockView, times(6)).showEmptyError()

        // email, password共に空でない時は、EmptyErrorは表示されない
        sut.didSelectLoginAction(email: "email", password: "password")
        verify(mockView, times(6)).showEmptyError()
    }

    /// emailアドレスとパスワードが空でない時
    ///   - バリデーションエラーにならない
    func testDidSelectLoginAction_withNotEmptyEmailAddress_And_Password() {
        sut.didSelectLoginAction(email: "email", password: "password")
        verify(mockView, times(0)).showEmptyError()
    }

    /// ログインに成功した時
    ///   - タスク一覧画面へ遷移する
    func testDidSelectLoginAction_Success() {
        stub(mockAuthUseCase) { stub in
            when(stub.login(emailAddress: any(), password: any(), onSuccess: any(), onError: any())).then { (_, _, onSuccess, _) in
                onSuccess()
            }
        }
        sut.didSelectLoginAction(email: "email", password: "password")
        verify(mockWireframe, times(1)).showTaskListViewController()
    }

    /// ネットワークエラーでログインに失敗した時
    ///   - ネットワークエラーが出力される
    func testDidSelectLoginAction_Failure_Network() {
        stub(mockAuthUseCase) { stub in
            when(stub.login(emailAddress: any(), password: any(), onSuccess: any(), onError: any())).then { (_, _, _, onError) in
                onError(AuthErrorCode.networkError)
            }
        }
        sut.didSelectLoginAction(email: "email", password: "password")
        verify(mockView, times(1)).showNetworkError()
    }

    /// その他のエラーでログインに失敗した時
    ///   - ログインエラーが出力される
    func testDidSelectLoginAction_Failure_Other() {
        stub(mockAuthUseCase) { stub in
            when(stub.login(emailAddress: any(), password: any(), onSuccess: any(), onError: any())).then { (_, _, _, onError) in
                onError(AuthErrorCode.wrongPassword)
            }
        }
        sut.didSelectLoginAction(email: "email", password: "password")
        verify(mockView, times(1)).showLoginError()
    }

    /// 新規会員登録画面への遷移アクション
    ///   - 遷移が実行される
    func testDidSelectMoveToRegisterAction() {
        sut.didSelectMoveToRegisterAction()
        verify(mockWireframe, times(1)).showRegiserViewController()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
