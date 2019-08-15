//
//  ArticleCell.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/15/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleIV: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    var article: Article!
    
    func setup(_ article: Article) {
        self.article = article
        setup()
        self.titleLbl.text = article.title
        //Date à formatter en il y a
        dateLbl.text = self.article.pubDate.ilYA()
        
        articleIV.sd_setImage(with: URL(string: self.article.imageUrl), placeholderImage: BUMBLE_IMAGE , options: SDWebImageOptions.highPriority, completed: nil )
    }
    

}
