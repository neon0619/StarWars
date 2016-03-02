//
//  DetailsListCell.swift
//  StarWars
//
//  Created by --=_t0tep_=-- on 02/03/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit


class DetailsListCell: UITableViewCell {
    

    @IBOutlet weak var lblKeyName: UILabel!
    @IBOutlet weak var lblValueName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}