//
//  ProductDescriptionCell.swift
//  HappyShop
//
//  Created by AshokKumar on 03/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

protocol ProductDescriptionCellDelegate: NSObjectProtocol {
    func didSelectAddToCart()
}

class ProductDescriptionCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    weak var delegate: ProductDescriptionCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureAddToCartButton(isItemAddedInCart: Bool){
        if isItemAddedInCart {
            addToCartBtn.setTitle("Go to Cart", for: .normal)
        }
        else{
            addToCartBtn.setTitle("Add to Cart", for: .normal)
        }
    }
    
    func configureCellWithDetails(_ details: ProductDetailsItem?) {
        self.nameLabel.text = details?.name
        self.descriptionLabel.text = details?.productDescription
        if let price = details?.price {
            self.priceLabel.text = String(price)
        }
        if let _ = details?.onSale {
            self.offerLabel.text = "On sale"
        }
        else{
            self.offerLabel.text = nil
        }
        addCornerRadius()
    }

    func addCornerRadius() {
        self.addToCartBtn.layer.cornerRadius = 5.0
        self.addToCartBtn.clipsToBounds = true
    }
    
    @IBAction func addToCartBtnAction() {
        self.delegate?.didSelectAddToCart()
    }
    
}
