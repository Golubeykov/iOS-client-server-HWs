//
//  LikeButton.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 10/03/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit

class LikeButton: UIButton {

   var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.blue.cgColor
        layer.cornerRadius = frame.size.height/2
        setTitleColor(UIColor.blue, for: .normal)
        addTarget(self, action: #selector(LikeButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? UIColor.blue : .clear
        let title = bool ? "♥ : 1" : "♥ : 0"
        let titleColor = bool ? UIColor.white : UIColor.blue
        let FrameH = bool ? frame.size.height*1.1 : frame.size.height/1.1
        let FrameW = bool ? frame.size.width*1.1 : frame.size.width/1.1
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        frame.size.height = FrameH
        frame.size.width = FrameW
    }
    
    
}
