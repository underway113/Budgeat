//
//  TodayCell.swift
//  Budgeat
//
//  Created by Owen Prasetya on 28/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class TodayCell: UITableViewCell {

    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodDetail: UILabel!
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodOverlay: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        foodImage.layer.cornerRadius = 10
        foodOverlay.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
