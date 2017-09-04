//
//  ProductViewModelTest.swift
//  HappyShop
//
//  Created by AshokKumar on 04/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import XCTest
@testable import HappyShop

class ProductViewModelTest: XCTestCase {
    
    var model = ProductDetailViewModel()
    var exp: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        model.productId = "26"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testProductId() {
        XCTAssert(model.productId.characters.count > 0, "Product id is missing")
    }
    
    func testGetProductDetails(){
        
        exp = expectation(description: "ProductDetails")
        
        model.getProductDetails({[weak self] (success) in
            XCTAssertNotNil(self?.model.productDetails, "Not able to get product details")
            self?.exp?.fulfill()
        }) {[weak self](error) in
            XCTAssertNil(error, "error in pagination")
            self?.exp?.fulfill()
        }
        
        self.waitForExpectations(timeout: 30.0) { (error) in
            XCTAssertNil(error, "Error in test expectation fullfill")
        }
    }
    
    func testAddToCart() {
        let isProductInCart = model.isProductAddedToCart()
        if isProductInCart == false {
            model.addItemToCart()
            XCTAssert(model.isProductAddedToCart(), "Add item to Cart Failed")
        }
    }
}
