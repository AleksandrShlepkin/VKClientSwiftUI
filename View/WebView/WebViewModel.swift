//
//  WebView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 13.12.2021.
//

import Foundation
import UIKit
import WebKit
import Combine
import SwiftUI


struct myWebView: UIViewRepresentable {
    
    @ObservedObject var session = Session.shared
    fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    
    var type: URLType
    var url: String?
    typealias UIViewType = WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
            webView.navigationDelegate = navigationDelegate
            return webView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let request = autorization() {
                  uiView.load(request)
              }
    }
    
    func autorization() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7822904"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends, photo, wall, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        return urlComponents.url.map { URLRequest(url: $0) }
    }
}

enum WebViewNavigation {
    case backward, forward, reload
}

enum URLType {
    case local, `public`
    
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    @ObservedObject var session = Session.shared
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        UserDefaults.standard.set(token, forKey: "vkToken")
        NotificationCenter.default.post(name: NSNotification.Name("vkTokenSaved"), object: self)
        
        decisionHandler(.cancel)
        
        session.token = token
        session.userID = userIdString
        session.isAvtorisation = true
        
    }
}
