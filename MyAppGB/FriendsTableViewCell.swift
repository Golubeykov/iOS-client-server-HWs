//
//  FriendsTableViewCell.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 08/03/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit

struct Person {
    let image: UIImage
    let name: String
}

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var FriendImage: UIImageView!
    @IBOutlet weak var FriendLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

