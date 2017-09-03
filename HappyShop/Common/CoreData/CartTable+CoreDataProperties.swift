//
//  CartTable+CoreDataProperties.swift
//  
//
//  Created by AshokKumar on 03/09/17.
//
//

import Foundation
import CoreData


extension CartTable {

    @nonobjc public class func fetchRequestWithId(_ id: Int64) -> NSFetchRequest<CartTable> {
        let fetchRequest = NSFetchRequest<CartTable>(entityName: "CartTable")
        fetchRequest.predicate = NSPredicate(format: "productId == %d", id)
        return fetchRequest
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartTable> {
        let fetchRequest = NSFetchRequest<CartTable>(entityName: "CartTable")
        return fetchRequest
    }

    @NSManaged public var productId: Int64
    @NSManaged public var name: String?
    @NSManaged public var productDetails: String?
    @NSManaged public var category: String?

}
