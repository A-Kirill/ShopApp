//
//  ProductDataTest.swift
//  ShopAppTests
//
//  Created by Kirill Anisimov on 25.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import XCTest
@testable import ShopApp

class ProductDataTest: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Test method requestProductData with id")
    var requestFactory: RequestFactory!
    var idProduct: Int!
    
    override func setUp() {
        super.setUp()
        requestFactory = RequestFactory()
        idProduct = 3
    }
        
    override func tearDown() {
        super.tearDown()
        requestFactory = nil
        idProduct = nil
    }

    func testGetProductData() {
        
        let pruductRequest = requestFactory.makeProductDataRequestFatory()
        
        pruductRequest.getProductData(id: idProduct) { response in
            switch response.result {
            case .success(let product):
                self.checkProductResult(product)
                break
            case .failure(let error):
                XCTFail("ProductTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    private func checkProductResult(_ product: ProductDataResult) {
        if product.result != 1 {
            XCTFail("ProductTests: host response incorrect")
        }
        if product.price <= 0 {
            XCTFail("ProductTests: incorrect price")
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
