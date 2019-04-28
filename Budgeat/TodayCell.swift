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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
