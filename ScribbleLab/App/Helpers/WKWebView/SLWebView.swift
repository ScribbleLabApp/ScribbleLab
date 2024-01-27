//
//  SLWebView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 27.01.24.
//

import SwiftUI
import WebKit

struct SLWebView: UIViewControllerRepresentable {
    let url: String
    @Binding var showToolbar: Bool

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: SLWebView

        init(_ parent: SLWebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.readyState") { (result, error) in
                if let readyState = result as? String, readyState == "complete" {
                    // Hide the toolbar after the web page has finished loading
                    DispatchQueue.main.async {
                        self.parent.showToolbar = false
                    }
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        viewController.view = webView
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        guard let webView = uiViewController.view as? WKWebView else {
            return
        }
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        // Update the navigation bar visibility when needed
        uiViewController.navigationController?.setNavigationBarHidden(!showToolbar, animated: false)
    }
}
