//
//  ProductServiceTest.swift
//  HappyShop
//
//  Created by AshokKumar on 04/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import XCTest
@testable import HappyShop

class ProductServiceTest: XCTestCase {

    let productService = ProductService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCategoryDetailsService() {
        
        let expectation = self.expectation(description: "CategoryDetailsService")
        
        productService.getCategoryDetails("Makeup", pageNo: 1, successBlock: { (data) in
            XCTAssertNotNil(data as? Array<CategoryItemDetails>, "Category Details Not received")
            expectation.fulfill()
        }) { (error) in
            XCTAssert(true, "Error in API Call")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 30.0) { (error) in
            XCTAssertNil(error, "Error in test expectation fullfill")
        }
    }
    
    func testProductDetailsSerice(){
        
        let exp = expectation(description: "ProductDetailsSerice")
        
        productService.getProductDetails("26", successBlock: { (data) in
            XCTAssertNotNil(data as? ProductDetailsItem, "Product Details Not received")
            exp.fulfill()
        }) { (error) in
            XCTAssert(true, "Error in API Call")
            exp.fulfill()
        }
        
        self.waitForExpectations(timeout: 30.0) { (error) in
            XCTAssertNil(error, "Error in test expectation fullfill")
        }
    }
}
