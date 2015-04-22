//
//  GTTableViewCell.swift
//  GTMassive
//
//  Created by KEEVIN MITCHELL on 4/21/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class GTTableViewCell: PFTableViewCell {
    
    @IBOutlet weak var gtImageView:UIImageView?
    @IBOutlet weak var gtNameLabel:UILabel?
    @IBOutlet weak var gtVotesLabel:UILabel?
    @IBOutlet weak var gtCreditLabel:UILabel?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
