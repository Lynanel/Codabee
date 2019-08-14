//
//  Extension UI.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/14/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

extension UITableView {
    
    func setup(){
        backgroundColor = .clear
        separatorStyle = .none
        tableFooterView = UIView()
    }
}

extension UITableViewCell {
    
    func setup() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
}
