//
//  ShopAppUITests.swift
//  ShopAppUITests
//
//  Created by Kirill Anisimov on 17.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import XCTest

class ShopAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSuccessRegistration() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.buttons["SIGNUP"]/*[[".scrollViews.buttons[\"SIGNUP\"]",".buttons[\"SIGNUP\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["SIGNUP"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        
        let nameTextField = elementsQuery.textFields["Name"]
        nameTextField.tap()
        nameTextField.typeText("Name")
        
        let passwordTextField = elementsQuery.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("Qwerty")
        
        let repeatPasswordTextField = elementsQuery.secureTextFields["Repeat password"]
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText("Qwerty")
        
        let emailTextField = elementsQuery.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("examp@mail.ru")
        
        let genderTextField = elementsQuery.textFields["Gender"]
        genderTextField.tap()
        genderTextField.typeText("m")
        
        let creditCardTextField = elementsQuery.textFields["Credit card"]
        creditCardTextField.tap()
        creditCardTextField.typeText("4444-4444-4444-4444")
        
        elementsQuery.staticTexts["Credit card"].swipeUp()
        
        let someInformationAboutYouTextField = elementsQuery.textFields["Some information about you"]
        someInformationAboutYouTextField.tap()
        
        
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["REGISTER"]/*[[".buttons[\"REGISTER\"].staticTexts[\"REGISTER\"]",".staticTexts[\"REGISTER\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testUnsuccessRegistration() throws {
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.buttons["SIGNUP"]/*[[".scrollViews.buttons[\"SIGNUP\"]",".buttons[\"SIGNUP\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["SIGNUP"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        
        let nameTextField = elementsQuery.textFields["Name"]
        nameTextField.tap()
        nameTextField.typeText("Name")
        
        let passwordTextField = elementsQuery.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("Qwerty")
        
        let repeatPasswordTextField = elementsQuery.secureTextFields["Repeat password"]
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText("Not Qwerty")
        
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["REGISTER"]/*[[".buttons[\"REGISTER\"].staticTexts[\"REGISTER\"]",".staticTexts[\"REGISTER\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
