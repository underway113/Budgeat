//
//  SearchCell.swift
//  Budgeat
//
//  Created by Jeremy Adam on 26/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var lblFoodName: UILabel!
    
    @IBOutlet var imageFood: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
