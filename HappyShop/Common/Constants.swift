//
//  Constants.swift
//  PropertyGuruTest
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

enum APIType {
    case categoryDetails, productDetail
}

class Constants {
    
    static let categoryDetailUrl = "api/v1/products.json?category="
    static let productDetailUrl = "api/v1/products/"
    
    static let baseUrl = "http://sephora-mobile-takehome-2.herokuapp.com/"
    static let baseImageUrl = "https://nytimes.com/"
}
