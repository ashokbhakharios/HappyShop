//
//  ProductDeetailViewModel.swift
//  HappyShop
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit
import CoreData

class ProductDetailViewModel: NSObject {
    
    enum ProductDetailsCellType: Int {
        case imageCell, descriptionCell
    }
    
    var productId: String = ""
    var cellTypes = Array<ProductDetailsCellType>()
    var productDetails: ProductDetailsItem?
    
    
    func getCellTypes() -> Array<ProductDetailsCellType> {
        cellTypes = [.imageCell, .descriptionCell]
        return cellTypes
    }
    
    func isProductAddedToCart() -> Bool{
        
        guard productId.isEmpty == false else {
            return false
        }
        
        let context = CoreDataHandler.sharedInstance.managedObjectContext
        let fetchRequest = CartTable.fetchRequestWithId(Int64(productId)!)
        
        var isProductAdded = false
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                isProductAdded = true
            }
        } catch  {
            
        }
        return isProductAdded
    }
    
    func addItemToCart() {
        
        let context = CoreDataHandler.sharedInstance.managedObjectContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "CartTable", in:context)
        let obj = CartTable(entity: entity!, insertInto: context)
        obj.productId = Int64(productId)!
        obj.category = self.productDetails?.category
        obj.name = self.productDetails?.name
        obj.productDetails = self.productDetails?.productDescription
        
        do {
            try context.save()
        } catch  {
            
        }
        
    }
    
    
    func getProductDetails(_ successBoock: @escaping CompletionBlock, failureBlock: @escaping CompletionBlock) {
        let service = ProductService()
        service.getProductDetails(productId, successBlock: {[weak self] (data) in
            if let item = data as? ProductDetailsItem {
                self?.productDetails = item
                successBoock(nil)
            }
            failureBlock(nil)
        }) { (error) in
            //Error Handling
            failureBlock(error)
        }
    }

}
