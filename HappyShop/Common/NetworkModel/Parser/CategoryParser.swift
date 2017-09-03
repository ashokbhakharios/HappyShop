//
//  CategoryParser.swift
//  HappyShop
//
//  Created by AshokKumar on 03/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class CategoryParser: BaseParser {

    override func parseResponse(_ response: Any?) -> Any? {
        guard let dict = response as? Dictionary<String, Any> else {
            return nil
        }
        return getCategoryListFromDict(dict)
    }
    
    func getCategoryListFromDict(_ dict: Dictionary<String, Any>) -> Array<CategoryItemDetails>? {
        
        guard let categoryList = dict["products"] as? Array<Dictionary<String, Any>> else {
            return nil
        }
        
        var categoryItems = Array<CategoryItemDetails>()
        
        for productDict in categoryList {
            let item = CategoryItemDetails()
            if let id = productDict["id"] as? String {
                item.id = id
            }
            else if let id = productDict["id"] as? Int {
                item.id = String(id)
            }
            item.category = productDict["category"] as? String
            item.name = productDict["name"] as? String
            item.imageUrl = productDict["img_url"] as? String
            item.price = productDict["price"] as? Float
            if let onsale = productDict["under_sale"] as? Bool {
                item.onSale = onsale
            }
            categoryItems.append(item)
        }
        
        return categoryItems
    }
    
}
