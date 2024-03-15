//
//  WebView.swift
//  Born Again
//
//  Created by Corbin Jensen on 3/14/24.
//

import SwiftUI
import WebKit

struct WebView: View {
    var body: some View {
        WebsiteViewer()
    }
}

struct WebsiteViewer: UIViewRepresentable {
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView();
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    let request = URLRequest(url: URL(string: "https://www.bornagain.app")!)
    uiView.load(request)
  }
}

#Preview {
    WebView()
}
