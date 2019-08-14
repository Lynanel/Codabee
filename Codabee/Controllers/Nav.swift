//
//  Nav.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/14/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class Nav: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barTintColor = .darkGray
        navigationBar.tintColor = HONEY_COLOR
        navigationBar.titleTextAttributes = [
            .foregroundColor: HONEY_COLOR,
            .font: UIFont.italicSystemFont(ofSize: 20)
        ]
    }

}
