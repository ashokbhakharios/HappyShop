//
//  BaseTabBarViewController.swift
//  HappyShop
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateCartCount), name: NSNotification.Name(rawValue: "cartItemUpdated"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateCartCount()
    }
    
    //MARK:- Update Cart Items Count
    
    func updateCartCount(){
        let tabBar = self.tabBar.items?[1]
        tabBar?.badgeValue = String(getCartItemCount())
    }
    
    func getCartItemCount() -> Int {
        var cartCount = 0
        let context = CoreDataHandler.sharedInstance.managedObjectContext
        
        do {
            let results = try context.fetch(CartTable.fetchRequest())
            cartCount = results.count
            
        } catch  {
            
        }
        
        return cartCount
    }

}
