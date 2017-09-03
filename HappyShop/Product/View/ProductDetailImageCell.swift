//
//  ProductDetailImageCell.swift
//  HappyShop
//
//  Created by AshokKumar on 03/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit
import SDWebImage

class ProductDetailImageCell: UITableViewCell {

    @IBOutlet weak var prductImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWithDetails(_ details: ProductDetailsItem?) {
        if let urlStr = details?.imageUrl {
            self.prductImageView.sd_setImage(with: URL(string: urlStr), placeholderImage: UIImage(named: "placeholder.jpg"))
        }
    }

}
