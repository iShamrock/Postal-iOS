//
//  TextTableViewCell.swift
//  PostalWatch
//
//  Created by 李逢双 on 3/8/15.
//  Copyright (c) 2015 Fudan. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var postalText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
