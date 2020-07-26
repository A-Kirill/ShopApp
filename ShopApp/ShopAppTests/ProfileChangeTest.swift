//
//  ProfileChangeTest.swift
//  ShopAppTests
//
//  Created by Kirill Anisimov on 25.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import XCTest
@testable import ShopApp

class ProfileChangeTest: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Test profileChange method")
    var requestFactory: RequestFactory!
    var idUser: Int!
    var userName: String!
    var password: String!
    var email: String!
    var gender: String!
    var creditCard: String!    
    var bio: String!
    
    override func setUp() {
        super.setUp()
        requestFactory = RequestFactory()
        idUser = 123
        userName = "Kirill"
        password = "pass"
        email = "corp@gmail.com"
        gender = "m"
        creditCard = "1111-2222-3333-4444"
        bio = "Hi everyone!!!"
    }
    
    override func tearDown() {
        super.tearDown()
        requestFactory = nil
        idUser = nil
        userName = nil
        password = nil
        email = nil
        gender = nil
        creditCard = nil        
        bio = nil
    }
    
    func testProfileChange() {
        
        let profile = requestFactory.makeProfileChangeRequestFatory()
        profile.profileChange(idUser: idUser,
                              userName: userName,
                              password: password,
                              email: email,
                              gender: gender,
                              creditCard: creditCard,
                              bio: bio) { response in
                                switch response.result {
                                case .success(let profile):
                                    self.checkChangeProfileResult(profile)
                                    break
                                case .failure(let error):
                                    XCTFail("ChangeProfileTests: \(error.localizedDescription)")
                                }
                                self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    private func checkChangeProfileResult(_ profile: ProfileChangeResult) {
        if profile.result != 1 {
            XCTFail("ChangeProfileTests: host response incorrect")
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
