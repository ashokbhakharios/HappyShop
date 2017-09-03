//
//  HomeViewModel.swift
//  HappyShop
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {

    var categoryList = Array<String>()
    
    func getCategoryList() -> Array<String>{
        categoryList = ["Makeup", "Skincare", "Nails", "Tools", ""]
        return categoryList
    }
}
