//
//  WebView.swift
//  IS543Proj1
//
//  Created by Jacob Ridgwell on 9/27/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    override func loadView() {
         let webConfiguration = WKWebViewConfiguration()
         webView = WKWebView(frame: .zero, configuration: webConfiguration)
         webView.uiDelegate = self
         view = webView
     }
    
     override func viewDidLoad() {
         super.viewDidLoad()
         
         let myURL = URL(string:"https://www.hundredpushups.com")
         let myRequest = URLRequest(url: myURL!)
         webView.load(myRequest)
     }
}
