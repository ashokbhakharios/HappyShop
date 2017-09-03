//
//  ProductDetailParser.swift
//  HappyShop
//
//  Created by AshokKumar on 03/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class ProductDetailParser: BaseParser {

    override func parseResponse(_ response: Any?) -> Any? {
        guard let dict = response as? Dictionary<String, Any> else {
            return nil
        }
        return getProductDetailItemFromDict(dict)
    }
    
    func getProductDetailItemFromDict(_ dict: Dictionary<String, Any>) -> ProductDetailsItem?{
        
        guard let productDict = dict["product"] as? Dictionary<String, Any> else {
            return nil
        }
        
        let item = ProductDetailsItem()
        item.id = productDict["id"] as? String
        item.category = productDict["category"] as? String
        item.name = productDict["name"] as? String
        item.imageUrl = productDict["img_url"] as? String
        item.productDescription = productDict["description"] as? String
        item.price = productDict["price"] as? Float
        if let onsale = productDict["under_sale"] as? Bool {
            item.onSale = onsale
        }
        
        return item
    }
}
