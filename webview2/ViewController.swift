//
//  ViewController.swift
//  webview2
//
//  Created by Campbell,George on 1/8/16.
//  Copyright © 2016 Campbell,George. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WebView
    
    @IBOutlet weak var searchText: UITextField!

    required init(coder aDecoder: NSCoder) {
        self.webView = WebView()
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.setPosition(view)
        webView.setAppHome()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func siteHomeBtn(sender: UIButton) {
        webView.setUrl("http://www.top20.com")
    }

    @IBAction func searchBtn(sender: UIButton) {
        print ("Navigating to: \(searchText.text)")
        webView.setUrl(searchText.text)
    }
    
    @IBAction func appHomeBtn(sender: UIButton) {
        webView.setAppHome()
    }
    
    @IBAction func backBtn(sender: UIButton) {
        webView.back()
    }
    
    @IBAction func forwardBtn(sender: UIButton) {
        webView.forward()
    }
}

