//
//  LaunchViewController.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 21/03/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var Load3: UIView!
    @IBOutlet weak var Load1: UIView!
    @IBOutlet weak var Load2: UIView!
    
    
    override func viewDidLoad() {
    
        
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2, delay: 0, animations: {
            self.Load1.alpha = 0
        })
        UIView.animate(withDuration: 2, delay: 2, animations: {
            self.Load2.alpha = 0
            
            
        })
        UIView.animate(withDuration: 2, delay: 1, animations: {
            self.Load3.alpha = 0
            
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(loginVC, animated: true)
        
        }
    }

}
