//
//  messageTableViewCell.swift
//  Parse Chat
//
//  Created by Daniel Sung on 2/23/17.
//  Copyright © 2017 Daniel Sung. All rights reserved.
//

import UIKit

class messageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    var message: String! {
        didSet {
            messageLabel.text = message
        }
    }
    var user: String! {
        didSet {
            userLabel.text = user
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
