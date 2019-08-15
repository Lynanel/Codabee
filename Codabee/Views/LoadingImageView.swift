//
//  LoadingImageView.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/15/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class LoadingImageView: UIImageView {
    
    var timer = Timer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setup() {
        image = UIImageView(named: "darkBee")
        contentMode = .scaleAspectFit
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {(t) in
            UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        })
    }
    
    func stop() {
        timer.invalidate()
    }

}
