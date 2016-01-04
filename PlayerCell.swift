//
//  PlayerCell.swift
//  scorer
//
//  Created by Jacob Kohn on 12/12/15.
//  Copyright © 2015 Jacob Kohn. All rights reserved.
//

import Foundation
import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var editNameButton: UIButton!
    @IBOutlet weak var deletePlayerButton: UIButton!
    @IBOutlet weak var playerNameCell: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
