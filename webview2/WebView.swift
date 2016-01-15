//
//  WebView.swift
//  webview2
//
//  Created by Campbell,George on 1/15/16.
//  Copyright © 2016 Campbell,George. All rights reserved.
//

import UIKit
import WebKit

class WebView : WKWebView {
    
    var pageCounter=0
    
    /**
     Initialize the WKWebView.
     */
    init(){
        let webConfig:WKWebViewConfiguration = WKWebViewConfiguration()
        super.init(frame:CGRectZero,configuration:webConfig)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.allowsBackForwardNavigationGestures = true
    }
    
    /**
     Set the position for the WKWebView.
     */
    func setPosition(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false;
        let height = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: -100)
        let width = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item:self,attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 60)
        view.addConstraints([height, width, top])
    }
    
    /**
     Set the url the webview should display.
     */
    func setUrl(url:String!) {
        if url != nil {
            let url = NSURL(string:url)
            let request = NSURLRequest(URL:url!)
            self.loadRequest(request)
            pageCounter++
        }
    }
    
    /**
     Generate the home page.
     */
    func setAppHome() {
        // TODO - probably isn't going all the way back.
        while pageCounter-- > 0 {
            self.goBack()
        }
        let javaSCriptString="document.body.style.background=\"#ffc\""
        self.loadHTMLString("<h1>Top20</h1>", baseURL: nil)
        self.evaluateJavaScript(javaSCriptString, completionHandler: nil)
        
    }
    
    /**
     Handle forward navigation.
     */
    func forward() {
        if self.canGoForward {
            self.goForward()
            pageCounter++
        }
    }
    
    /**
     Handle backward navigation.
     */
    func back(){
        if self.canGoBack {
            self.goBack()
            pageCounter--
        }
    }
    
}
