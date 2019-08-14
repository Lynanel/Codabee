//
//  RootController.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/14/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class RootController: MenuContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //transition
        transitionOptions = TransitionOptions(duration: 0.2, visibleContentWidth: 50)
        
        //MenuController
        let storyboard = UIStoryboard(name: "Menu", bundle: nil)
        if let menu = storyboard.instantiateInitialViewController() as? MenusController {
            menuViewController = menu
        }
        
        //Contenu
        contenViewController = [
            getInitial(string: "Actualite"),
            getInitial(string: "Video"),
            getInitial(string: "Forum")
        ]
        
        //Selectionner le premier du contenu comme visible au départ
        if contentViewControllers.count > 0 {
            selectContentViewController(contentViewControllers.first!)
        }
    }
    
    func getInitial(string: String) -> UIViewController {
        let storyboard = UIStoryboard(name: string, bundle: nil)
        return storyboard.instantiateInitialViewController() ?? UIViewController
    }
    

}
