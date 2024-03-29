//
//  CustomView.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/14/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit


class CustomView: UIView {
    
    override init(frame: frame) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = HONEY_COLOR
        backgroundColor = .darkGray
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -4, height: 4)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.65
    }
}
