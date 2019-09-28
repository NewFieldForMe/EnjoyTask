//
//  LoginUITests.swift
//  EnjoyTaskUITests
//
//  Created by 山田良 on 2019/09/28.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import XCTest

class LoginUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTextFieldValues() {
        let app = XCUIApplication()
        let emailTextField = app.textFields[AccessibilityIdentifiers.Login.emailTextField]
        let passwordTextField = app.textFields[AccessibilityIdentifiers.Login.passwordTextField]

        emailTextField.tap()
        emailTextField.typeText("test@testexam.com")
        passwordTextField.tap()
        passwordTextField.typeText("test")

        XCTAssertEqual(emailTextField.value as? String, "test@testexam.com")
        XCTAssertEqual(passwordTextField.value as? String, "test")
    }

}
