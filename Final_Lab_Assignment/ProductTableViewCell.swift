//
//  ProductTableViewCell.swift
//  Final_Lab_Assignment
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 Karan. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

  @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl1: UILabel!
       
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }
