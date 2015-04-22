//
//  GTTableViewCell.swift
//  GTMassive
//
//  Created by KEEVIN MITCHELL on 4/21/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class GTTableViewCell: PFTableViewCell {
    
    var parseObject:PFObject? // to update vote
    
    @IBOutlet weak var gtImageView:UIImageView?
    @IBOutlet weak var gtNameLabel:UILabel?
    @IBOutlet weak var gtVotesLabel:UILabel?
    @IBOutlet weak var gtCreditLabel:UILabel?
    
    @IBOutlet weak var catPawIcon:UIImageView?    

    override func awakeFromNib() {
        let gesture = UITapGestureRecognizer(target: self, action:Selector("onDoubleTap:"))
        gesture.numberOfTapsRequired = 2
        contentView.addGestureRecognizer(gesture)
        
        catPawIcon?.hidden = true
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onDoubleTap(sender:AnyObject) {
        if(parseObject != nil) {
            if var votes:Int? = parseObject!.objectForKey("votes") as? Int {
                votes!++
                
                parseObject!.setObject(votes!, forKey: "votes");
                parseObject!.saveInBackground();
                
                gtVotesLabel?.text = "\(votes!) votes";
            }
        }
        
        
        
        catPawIcon?.hidden = false
        catPawIcon?.alpha = 1.0
        
        UIView.animateWithDuration(1.0, delay: 1.0, options:nil, animations: {
            
            self.catPawIcon?.alpha = 0
            
            }, completion: {
                (value:Bool) in
                
                self.catPawIcon?.hidden = true
        })
    }
    
}
