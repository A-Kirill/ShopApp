//
//  LogoutTest.swift
//  ShopAppTests
//
//  Created by Kirill Anisimov on 25.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import XCTest
@testable import ShopApp

class LogoutTest: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Test logout method")
    var requestFactory: RequestFactory!
    var idUser: Int!
    
    override func setUp() {
        requestFactory = RequestFactory()
        idUser = 123
    }
    
    override func tearDown() {
        requestFactory = nil
        idUser = nil
    }
    
    func testLogout() {
        let logout = requestFactory.makeLogoutRequestFatory()
        logout.logout(idUser: idUser) { response in
            switch response.result {
            case .success(let logout):
                self.checkLogoutResult(logout)
                break
            case .failure(let error):
                XCTFail("LogoutTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    private func checkLogoutResult(_ logout: LogoutResult) {
        if logout.result != 1 {
            XCTFail("LogoutTests: host response incorrect")
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
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
