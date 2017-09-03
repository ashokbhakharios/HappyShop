//
//  ProductDetailVC.swift
//  HappyShop
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class ProductDetailVC: BaseVC, UITableViewDataSource, UITableViewDelegate, ProductDescriptionCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var model = ProductDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doInitialConfigurtion()
        self.getProductDetails()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Initial Setup
    
    func doInitialConfigurtion(){
        _ = model.getCellTypes()
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
    }
    
    func getProductDetails(){
        self.activityIndicator.startAnimating()
        model.getProductDetails({[weak self] (success) in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }) { [weak self](error) in
            // Show error
            DispatchQueue.main.async  {
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    //MARK:- UITableView Cell Datasource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = self.model.cellTypes[indexPath.row]
        switch cellType {
        case .imageCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailImageCell") as! ProductDetailImageCell
            cell.configureCellWithDetails(self.model.productDetails)
            return cell

        case .descriptionCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDescriptionCell") as! ProductDescriptionCell
            cell.delegate = self
            cell.configureCellWithDetails(self.model.productDetails)
            cell.configureAddToCartButton(isItemAddedInCart: model.isProductAddedToCart())
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK:- Product Cell Delegate
    
    func didSelectAddToCart() {
        if model.isProductAddedToCart() == false {
            model.addItemToCart()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cartItemUpdated"), object: nil)
            self.tableView.reloadData()
        }
        else{
            //Go To Cart
        }
    }

}
