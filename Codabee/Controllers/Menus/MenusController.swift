//
//  MenusController.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/14/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class MenusController: UIViewController {
    
    @IBOutlet weak var tableViewActu: UITableView!
    

    var item = ["Fil d'actualité", "Vidéos", "Forum"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        tableViewActu.delegate = self
        tableViewActu.dataSource = self
        tableViewActu.setup(color: .clear)
    }

}

extension MenusController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuContainerViewController?.contentViewControllers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewActu.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuCell {
            cell.setup(items[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let main = menuContainerViewController {
            main.selectContentViewController(main.ContentViewControllers[indexPath.row])
            main.hideSideMenu()
        }
    }
}
