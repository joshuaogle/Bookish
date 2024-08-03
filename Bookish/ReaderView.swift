import SwiftUI
import WebKit

struct ReaderView: UIViewRepresentable {
    var bookPath: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: bookPath) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update UI if needed
    }
}
