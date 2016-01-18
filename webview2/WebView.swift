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
    
    /**
     Initialize the WKWebView.
     */
    init(){
        let webConfig:WKWebViewConfiguration = WKWebViewConfiguration()
        super.init(frame:CGRectZero,configuration:webConfig)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.allowsBackForwardNavigationGestures = true
        createHomePage()
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
        }
    }
    
    /**
     Create the home page.
     */
    func createHomePage() {
        self.setUrl("about:blank")
        drawHomePage()
    }
    
    /**
     Draw the home page.
     */
    func drawHomePage() {
        let javaSCriptString="document.body.style.background=\"#ffc\""
        //self.loadHTMLString("<h1>Top20</h1>", baseURL: nil)
        self.evaluateJavaScript(javaSCriptString, completionHandler: nil)
    }
    
    /**
     Go to the home page.
     */
    func setAppHome() {
        print("The first item is \(self.findFirstItem()?.URL)")
        let item = findFirstItem()
        if item != nil {
            self.goToBackForwardListItem(item!)
            drawHomePage()
        }
    }
    
    /**
     Find the first item in the list of websites.
     */
    func findFirstItem() -> WKBackForwardListItem? {
        var index=0
        if (self.backForwardList.itemAtIndex(0)==nil) {
            return nil
        }
        while self.backForwardList.itemAtIndex(index) != nil {
            index--
        }
        return self.backForwardList.itemAtIndex(index+1)
    }
    
    /**
     Handle forward navigation.
     */
    func forward() {
        if self.canGoForward {
            self.goForward()
        } else {
            print("Cannot go forward.")
        }
    }
    
    /**
     Handle backward navigation.
     */
    func back(){
        if self.canGoBack {
            self.goBack()
        } else {
            print("Cannot go backwards.")
        }
    }
    
}
