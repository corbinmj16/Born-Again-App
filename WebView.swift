//
//  WebView.swift
//  Born Again
//
//  Created by Corbin Jensen on 3/14/24.
//

import SwiftUI
import WebKit


struct WebView: View {
    @State private var isSheetPresented = false
    @State private var isLoading = true
    @State private var clickedUrl: URL?
    @State private var mainUrl: URL = URL(string: "http://bornagain.app")!
  
    var body: some View {
      
      WebsiteViewer(
        isSheetPresented: $isSheetPresented,
        isLoading: $isLoading,
        clickedUrl: $clickedUrl,
        mainUrl: $mainUrl,
        webView: WKWebView()
      )
      .onChange(of: clickedUrl) { oldValue, newValue in
      }
      .sheet(isPresented: $isSheetPresented) {
        if (clickedUrl != nil) {
          BasicWebsiteViewer(url: clickedUrl!)
        } else {
          Text("Whoops, something went wrong. Please try again.")
        }
      }

    }
}

struct BasicWebsiteViewer: UIViewRepresentable {
  var url: URL
  
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    let request = URLRequest(url: url)
    uiView.load(request)
  }
}

struct WebsiteViewer: UIViewRepresentable {
  @Binding var isSheetPresented: Bool
  @Binding var isLoading: Bool
  @Binding var clickedUrl: URL?
  @Binding var mainUrl: URL
  var webView: WKWebView
  
  func makeUIView(context: Context) -> WKWebView {
    webView.uiDelegate = context.coordinator
    webView.navigationDelegate = context.coordinator
    
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    let request = URLRequest(url: mainUrl)
    uiView.load(request)
  }
  
}

extension WebsiteViewer {
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(parent: self)
  }
  
  class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
    var parent: WebsiteViewer
    private var webViews: [WKWebView]
    
    init(parent: WebsiteViewer) {
      self.parent = parent
      self.webViews = []
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
      if navigationAction.targetFrame == nil {
        parent.mainUrl = webView.url!
        parent.clickedUrl = navigationAction.request.url!
        parent.isSheetPresented = true
      }
      
      return nil
    }
    
    // Main app is loading
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      print("loading")
      parent.isLoading = true
    }
    
    // main app is done loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      print("finished")
      parent.isLoading = false
    }
  }
}

#Preview {
  WebView()
}
