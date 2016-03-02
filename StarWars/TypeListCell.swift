//
//  TypeListCell.swift
//  StarWars
//
//  Created by --=_t0tep_=-- on 28/02/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit


class TypeListCell: UITableViewCell {
    
    
    @IBOutlet weak var imgtType: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}