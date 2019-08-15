//
//  WebController.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/15/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import WebKit

class WebController: UIViewController {

   @IBOutlet weak var webView: WKWebView!
    
    var urlString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let link = urlString, let url = URL(string: link) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(URLRequest)
    }

}
