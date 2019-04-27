//
//  GroupsCollectionViewCell.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 08/03/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit

struct Group {
    let image: UIImage
    let name: String
}

class GroupsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var GroupLabel: UILabel!
    @IBOutlet weak var GroupImage: UIImageView!
    
    
}
