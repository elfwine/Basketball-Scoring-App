//
//  TeamCell.swift
//  scorer
//
//  Created by Jacob Kohn on 12/11/15.
//  Copyright © 2015 Jacob Kohn. All rights reserved.
//

import Foundation
import UIKit

class TeamCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var useButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}