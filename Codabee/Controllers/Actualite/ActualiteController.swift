//
//  ActualiteController.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/14/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
//import InteractiveSideMenu

class ActualiteController: UITableViewController, UITableViewDelegate, SIdeMenuItemContent {

    var articles: [Article] = []
    let segueDetail = "Detail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Actualités"
        tableView.setup(color: .darkGray)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(parse), for: .valueChanged)
        
        parse()
    }
    
    @objc func parse() {
        RSSParser().parse(CODABEE_FEED) { (art) in
            DispatchQueue.main.async {
                self.articles = art
                print("Articles count: \(self.articles.count)")
                self.tableView.reloadData()
                
                //
                if self.tableView.refreshControl?.isRefreshing ?? false {
                    self.tableView.refreshControl?.endRefreshing()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? ArticleCell {
            cell.setup(articles[indexPath.row])
            return cell
        }
        return UITableViewCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = articles[indexPath.row].link
        performSegue(withIdentifier: segueDetail, sender: urlString)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //guard let segue = segue.identifier != nil else { return }
        if segue.identifier == segueDetail, let controller = segue.destination as? WebController {
                controller.urlString = sender as? String
        }
    }
    
    @IBAction func showMenu(_ sender: Any) {
        showSideMenu()
    }
    
}
