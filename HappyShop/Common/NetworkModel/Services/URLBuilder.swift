//
//  URLBuilder.swift
//  PropertyGuruTest
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class URLBuilder {
    
    static func getCategoryDetailsUrl(_ category: String, page: Int) -> String {
        var urlstr = Constants.baseUrl
        urlstr.append(Constants.categoryDetailUrl)
        urlstr.append(category)

        urlstr.append("&page=\(page)")
        return urlstr
    }
    
    static func getProductDetailsUrl(_ productId: String) -> String {
        var urlstr = Constants.baseUrl
        urlstr.append(Constants.productDetailUrl)
        urlstr.append("\(productId).json")
        return urlstr
    }
}
