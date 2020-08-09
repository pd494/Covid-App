//
//  ViewDataCell.swift
//  Covid Cases
//
//  Created by Raghav Punnam on 8/9/20.
//  Copyright © 2020 Prasanth Dendukuri. All rights reserved.
//

import UIKit

class ViewDataCell: UITableViewCell {

    // fields for cell
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
