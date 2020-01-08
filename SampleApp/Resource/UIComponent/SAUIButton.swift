//
//  SAUIButton.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 08/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

public class SAUIButton: UIButton {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
//        self.backgroundColor = UIColor.systemBlue
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.lineBreakMode = .byClipping
        self.setTitleColor(UIColor.systemBlue, for: .normal)
        self.titleLabel?.textAlignment = .center
    }

}
