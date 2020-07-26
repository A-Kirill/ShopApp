//
//  CatalogDataTest.swift
//  ShopAppTests
//
//  Created by Kirill Anisimov on 25.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import XCTest
@testable import ShopApp

class CatalogDataTest: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Test requestCatalogData method")
    var requestFactory: RequestFactory!
    var pageNumber: Int!
    var idCategory: Int!
    
    override func setUp() {
        super.setUp()
        requestFactory = RequestFactory()
        pageNumber = 1
        idCategory = 1
    }
        
    override func tearDown() {
        super.tearDown()
        requestFactory = nil
        pageNumber = nil
        idCategory = nil
    }
    
    func testGetCatalogData() {
        
        let catalogData = requestFactory.makeCatalogDataRequestFatory()
        catalogData.getCatalogData(pageNumber: pageNumber, idCategory: idCategory) { response in
            switch response.result {
            case .success(let catalog):
                self.checkCatalogDataResult(catalog)
                break
            case .failure(let error):
                XCTFail("CatalogDataTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    private func checkCatalogDataResult(_ catalog: [Product]) {
        if catalog.count == 0 {
            XCTFail("CatalogDataTests: catalog is empty")
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
