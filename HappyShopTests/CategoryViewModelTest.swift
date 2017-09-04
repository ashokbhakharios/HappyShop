//
//  CategoryViewModelTest.swift
//  HappyShop
//
//  Created by AshokKumar on 04/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import XCTest
@testable import HappyShop

class CategoryViewModelTest: XCTestCase, CategoryViewModelDelegate {

    var model = CategoryViewModel()
    var exp: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        
        model.categoryName = "Makeup"
        model.delegate = self

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCategoryDetailsData() {
        
        exp = self.expectation(description: "CategoryDetails")
        
        model.getCategoryDetails()
        
        self.waitForExpectations(timeout: 30.0) { (error) in
            XCTAssertNil(error, "Error in test expectation fullfill")
        }
        
        XCTAssert(model.categoryItems.count > 0, "Category Item Not Found")
    }
    
    func testCategoryDetailsOnPagination(){
        
        XCTAssertNotNil(model.delegate, "Delegte is not persent")
        
        model.getCategoryDetailsOnPagination()
        
        model.getCategoryDetailsOnPagination()
        
        XCTAssert(model.pageNo == 1, "Page should be increased by only one")
        
        self.waitForExpectations(timeout: 30.0) { (error) in
            XCTAssertNil(error, "Error in test expectation fullfill")
        }
        
        XCTAssert(model.pageNo == 2, "Page Count not increased, Pagination failed")
    }
    
    //MARK:- Category View Model Delegate
    
    func startedPaginationCall() {
        exp = expectation(description: "category pagination")
    }
    
    func finishedPaginationCall() {
        exp?.fulfill()
    }
    
    func reloadViewForNewSearchResult() {
        exp?.fulfill()
    }
    
    func errorOnGettingNewResults() {
        exp?.fulfill()
    }
}
