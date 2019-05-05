//
//  Session0ViewController.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 28/04/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit
class Session {
    static let instance = Session()
    
    private init(){}
    
    var Token = ""
    var UserID = ""
 
}
class Session0ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let session = Session.instance
        session.Token = "0001"
        session.UserID = "User0001"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
