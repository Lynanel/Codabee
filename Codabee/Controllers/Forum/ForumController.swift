//
//  ForumController.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/14/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
//import InteractiveSideMenu

class ForumController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Forum"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func showMenu(_ sender: Any) {
        showSideMenu()
    }
    
    
    
    
}
