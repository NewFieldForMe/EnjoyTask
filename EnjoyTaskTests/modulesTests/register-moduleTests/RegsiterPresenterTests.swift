//
//  RegsiterPresenterTests.swift
//  EnjoyTaskTests
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import XCTest
import Cuckoo
@testable import EnjoyTask

/// ** TODOs **
/// - OK: Registerアクションをタップしたら、バリデーションエラーが発生する
/// - OK: emailとpasswordを空でRegisterアクションを実行したらバリデーションエラーが発生する
/// - OK: emailとpasswordに何か入れてRegisterアクションを実行したらバリデーションエラーが発生しない
class RegsiterPresenterTests: XCTestCase {
    // System under test
    var sut: RegisterPresenter!
    var mockView: MockRegisterViewInterface!

    override func setUp() {
        mockView = MockRegisterViewInterface()
        stub(mockView) { stub in
            when(stub.showValidationError()).thenDoNothing()
        }
        sut = RegisterPresenter(view: mockView)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// emailアドレスとパスワードが空だった時
    ///   - バリデーションエラーになる
    func testDidSelectRegisterAction_withEmptyEmailAddress_And_Password() {
        sut.didSelectRegisterAction(email: nil, password: nil)
        verify(mockView, times(1)).showValidationError()

        sut.didSelectRegisterAction(email: "email", password: nil)
        verify(mockView, times(2)).showValidationError()

        sut.didSelectRegisterAction(email: nil, password: "password")
        verify(mockView, times(3)).showValidationError()
    }

    /// emailアドレスとパスワードが空でない時
    ///   - バリデーションエラーにならない
    func testDidSelectRegisterAction_withNotEmptyEmailAddress_And_Password() {
        sut.didSelectRegisterAction(email: "email", password: "password")
        verify(mockView, times(0)).showValidationError()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
