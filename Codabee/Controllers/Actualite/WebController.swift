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
    var loadingIV: LoadingImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let link = urlString, let url = URL(string: link) else { return }
        let urlRequest = URLRequest(url: url)
        webView.navigationDelegate = self
        
        //Créer une annimation
        loadingIV = LoadingImageView(frame: CGRect(x: view.frame.width / 2 - 75, y: 75, width: 150, height: 150))
        loadingIV?.start()
        if loadingIV != nil {
            view.addSubview(loadingIV!)
        }
        
        webView.load(URLRequest)
    }

}


extension WebController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIV?.stop()
        loadingIV?.removeFromSuperview()
        loadingIV = nil
    }
    
}
