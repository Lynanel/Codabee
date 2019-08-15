//
//  RSSParser.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/15/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import Foundation

class RSSParser: NSObject, XMLParserDelegate {
    
    var articles: [Article] = []
    var title = ""
    var pubDate = ""
    var link = ""
    var imaageUrl = ""
    
    var element = ""
    
    func parse(_ urlString: String) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, Error) in
                if Error == nil {
                    if let d = data {
                        let parser = XMLParser(data: d)
                        parser.delegate = self
                        parser.parse()
                    } else {
                        //Arrêter
                    }
                } else {
                    //Arrêter tout
                }
            }.resume()
        } else {
            //Arrête tout
        }
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        element = elementName
        if element == "item" {
            title = ""
            pubDate = ""
            link = ""
            imaageUrl = ""
        }
        
        if element == "enclosure" {
            if let url = attributeDict["url"] {
                imaageUrl = url
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch element {
        case "title": title += string
        case "link":
            if link == "" {
                link = string
            }
        case "pubDate":
            if pubDate == "" {
                pubDate = string
            }
        default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let new = Article(title: title, link: link, pubDate: pubDate, imageUrl: imaageUrl)
            articles.append(new)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        //Envoyer les données
        
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        //Arrêter
        
    }
    
}
