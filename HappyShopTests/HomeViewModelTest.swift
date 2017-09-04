//
//  HomeViewModelTest.swift
//  HappyShop
//
//  Created by AshokKumar on 04/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import XCTest
@testable import HappyShop

class HomeViewModelTest: XCTestCase {

    var model = HomeViewModel()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCategoryList() {
        let list = model.getCategoryList()
        XCTAssertEqual(list, model.categoryList, "Category List is not proper")
        XCTAssert(model.categoryList.first == "Makeup", "Makeup is not first item")
        XCTAssert(model.categoryList.count == 4, "Category list Count mismatch")
        XCTAssert(model.categoryList.last == "Tools", "Tools is not last item")
    }
    
    
}
