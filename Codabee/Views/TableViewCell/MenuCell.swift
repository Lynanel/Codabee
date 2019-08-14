//
//  MenuCell.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/14/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    func setup(_ string: String){
        nameLbl.text = string
    }

}
