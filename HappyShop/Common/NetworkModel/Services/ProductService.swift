//
//  ProductService.swift
//  HappyShop
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class ProductService: BaseServices {
    
    func getProductDetails(_ productid: String, successBlock: @escaping CompletionBlock, failureBlock: @escaping CompletionBlock){
        self.apiType = .productDetail
        self.successBlock = successBlock
        self.failureBlock = failureBlock
        _ = self.getWithURL(URLBuilder.getProductDetailsUrl(productid), parameters: nil)
    }
    
    func getCategoryDetails(_ categoryName: String, pageNo: Int, successBlock: @escaping CompletionBlock, failureBlock: @escaping CompletionBlock){
        self.apiType = .categoryDetails
        self.successBlock = successBlock
        self.failureBlock = failureBlock
        _ = self.getWithURL(URLBuilder.getCategoryDetailsUrl(categoryName, page: pageNo), parameters: nil)
    }
}
