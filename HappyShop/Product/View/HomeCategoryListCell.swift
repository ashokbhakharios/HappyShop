//
//  HomeCategoryListCell.swift
//  HappyShop
//
//  Created by AshokKumar on 03/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class HomeCategoryListCell: UITableViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWithName(_ name: String) {
        categoryNameLabel.text = name
    }

}
