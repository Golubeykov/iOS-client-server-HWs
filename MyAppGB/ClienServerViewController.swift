
import UIKit
import Alamofire
import WebKit

class ClienServerViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var WKView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WKView.navigationDelegate = self
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "6964658"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.95")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        WKView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
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
        
        let token = params["access_token"]
        
        print(token)
        
        Alamofire.request("https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&access_token=\(token!)&v=5.95").responseJSON { (response) in
            let json = response.value as! Dictionary<String, Any>
            let arr = json["response"] as! Array<Any>
            let respons = arr.first as! Dictionary<String, Any>
            print(respons["first_name"])
        }
        
        decisionHandler(.cancel)
    }



}
