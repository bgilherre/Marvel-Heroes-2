//
//  HeroeTableViewCell.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 06/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import UIKit

class HeroeTableViewCell: UITableViewCell {
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
