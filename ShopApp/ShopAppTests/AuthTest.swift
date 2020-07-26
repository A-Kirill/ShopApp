//
//  AuthTest.swift
//  ShopAppTests
//
//  Created by Kirill Anisimov on 24.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import XCTest
@testable import ShopApp

class AuthTest: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Test auth method")
    var requestFactory: RequestFactory!
    var userName: String!
    var password: String!
    
    override func setUp() {
        requestFactory = RequestFactory()
        userName = "Somebody"
        password = "mypassword"
    }
    
    override func tearDown() {
        requestFactory = nil
        userName = nil
        password = nil
    }
    
     func testAuthorization() {
         let auth = requestFactory.makeAuthRequestFatory()
         auth.login(userName: userName, password: password) { response in
             switch response.result {
             case .success(let login):
                 self.checkLoginResult(login)
                 break
             case .failure(let error):
                 XCTFail("LoginTests: \(error.localizedDescription)")
             }
             self.expectation.fulfill()
         }
         wait(for: [expectation], timeout: 10.0)
     }
     
    func checkLoginResult(_ login: LoginResult) {
         if login.result != 1 {
             XCTFail("LoginTests: host response incorrect")
         }
         if login.user.id < 1 {
             XCTFail("LoginTests: id is invalid")
         }
     }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        super.tearDown()

        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
