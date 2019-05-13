
import UIKit
import Alamofire
import WebKit
import SwiftyJSON

class ClientServerViewController3: UIViewController {
    @IBOutlet weak var UserGroupsTable: UITableView!
    var usergroups = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = Session.instance
        let token = session.token
        
        Alamofire.request("https://api.vk.com/method/groups.get?user_id=14421961&fields=id,name,screen_name&count=5&extended=1&access_token=\(token)&v=5.95").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let arrayNames =  json["response"]["items"].arrayValue.map {$0["name"].stringValue}
                print(arrayNames)
                self.usergroups.append(contentsOf: arrayNames)
                self.UserGroupsTable.reloadData()
                
                
            case .failure(let error):
                print(error)
                
            }
        
    }
    

}
}
extension ClientServerViewController3: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usergroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroups", for: indexPath) as! ServerGroupsTableViewCell
        let mygroup = usergroups[indexPath.row]
        cell.UserGroups.text = mygroup
        return cell
    }
    
}
extension ClientServerViewController3: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
