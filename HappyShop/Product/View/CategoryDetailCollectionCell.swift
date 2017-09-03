//
//  CategoryDetailCollectionCell.swift
//  HappyShop
//
//  Created by AshokKumar on 03/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit
import SDWebImage

class CategoryDetailCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var prductImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureCellWithDetails(_ details: CategoryItemDetails) {
        self.nameLabel.text = details.name
        self.priceLabel.text = String(details.price!)
        if details.onSale {
            self.offerLabel.text = "On sale"
        }
        else{
            self.offerLabel.text = nil
        }
        if let urlStr = details.imageUrl {
            self.prductImageView.sd_setImage(with: URL(string: urlStr), placeholderImage: UIImage(named: "placeholder.jpg"))
        }
        self.layoutIfNeeded()
        addCornerRadius()
    }
    
    func addCornerRadius() {
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.borderWidth = 1.0
        self.contentView.clipsToBounds = true
    }
}
