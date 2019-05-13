//
//  ClientServerViewController2.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 29/04/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit
import Alamofire
import WebKit
import SwiftyJSON
import RealmSwift

class User: Object {
    @objc dynamic var name : String?
    @objc dynamic var image : String?
    
}


class ClientServerViewController2: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var UserImage: UIImageView!
    
    @IBOutlet weak var UserName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = Session.instance
        let token = session.token
        
        
        
        Alamofire.request("https://api.vk.com/method/users.get?user_ids=golubeykov&fields=photo_200,sex&access_token=\(token)&v=5.95").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let arrayNames =  json["response"].arrayValue.map {$0["first_name"].stringValue}
                
                self.UserName.text = arrayNames.first
                let arrayNames2 =  json["response"].arrayValue.map {$0["photo_200"].stringValue}
                let URL_IMAGE = URL(string: "\(arrayNames2.first!)")
                print(arrayNames2.first)
                print(URL_IMAGE!)
                var myUser = User()
                myUser.name = arrayNames.first
                myUser.image = arrayNames2.first
                
                func saveWeatherData(_ myUser: [User]) {
                    
                    do {
                        
                        let realm = try Realm()
                        
                        
                        realm.beginWrite()
                        
                        
                        realm.add(myUser)
                        
                        
                        try realm.commitWrite()
                    } catch {
                        
                        print(error)
                    }
                }

                
                let session = URLSession(configuration: .default)
                
                //creating a dataTask
                let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
                    
                    //if there is any error
                    if let e = error {
                        //displaying the message
                        print("Error Occurred: \(e)")
                        
                    } else {
                        //in case of now error, checking wheather the response is nil or not
                        if (response as? HTTPURLResponse) != nil {
                            
                            //checking if the response contains an image
                            if let imageData = data {
                                
                                //getting the image
                                let image = UIImage(data: imageData)
                                
                                
                                //displaying the image
                                DispatchQueue.main.async{
                                self.UserImage.image = image!
                                }
                            } else {
                                print("Image file is currupted")
                            }
                        } else {
                            print("No response from server")
                        }
                    }
                }
                
                //starting the download task
                getImageFromUrl.resume()
                
                
                
            case .failure(let error):
                print(error)
            }
            
}
}
}
