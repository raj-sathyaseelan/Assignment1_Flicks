//
//  NowPlayingTableViewCell.swift
//  Flicks
//
//  Created by Raj Sathyaseelan on 10/15/16.
//  Copyright © 2016 Token. All rights reserved.
//

import UIKit

class NowPlayingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flickImageView: UIImageView!
    @IBOutlet weak var flickTitleLabel: UILabel!    
    @IBOutlet weak var flickDescTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
