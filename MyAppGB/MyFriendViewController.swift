//
//  MyFriendViewController.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 09/03/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit

class MyFriendViewController: UIViewController {
    var persons = [Person(image: #imageLiteral(resourceName: "Ivanov.jpg"), name: "Ivanov Ilya"), Person (image: #imageLiteral(resourceName: "Kudryavtseva.jpg"), name: "Yulia Kudryavtseva"), Person (image: #imageLiteral(resourceName: "Sevoyan.jpg"), name: "Artyom Sevoyan"), Person (image: #imageLiteral(resourceName: "Golubeykov.jpg"), name: "Nikita Golubeykov")]
    
    
    @IBOutlet weak var MyFriendImage: UIImageView!
    @IBOutlet weak var MyFriendName: UILabel!
    
    
    @IBOutlet weak var MyFriendView: UIView!
    @IBOutlet weak var ShadowView: UIView!
    
    @IBOutlet weak var MyFriendNews: UILabel!
    @IBOutlet weak var LikeButtonOutlet: LikeButton!
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        MyFriendName.text = persons[0].name
        MyFriendImage.image = persons[0].image
        if MyFriendName.text == "Artyom Sevoyan" {
            MyFriendNews.text = "29 февраля - никто не вечен"
        } else {
            MyFriendNews.text = "Только Артем Севоян вечен"
        }
        MyFriendImage.layer.masksToBounds = true
        MyFriendImage.layer.cornerRadius = 30
        
        ShadowView.layer.masksToBounds = false
        ShadowView.layer.shadowColor = UIColor.black.cgColor
        ShadowView.layer.shadowOpacity = 1.5
        ShadowView.layer.shadowRadius = 30
        ShadowView.layer.shadowOffset = CGSize.zero
        
        
    }
    
    @objc func handleTap() {
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.ShadowView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.3) {
                            self.ShadowView.transform = CGAffineTransform.identity
                        }
        })

    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        let gesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap)) //
        ShadowView.isUserInteractionEnabled = true
        ShadowView.addGestureRecognizer(gesterRecognizer)
        
        
    }
    
    
}



    


