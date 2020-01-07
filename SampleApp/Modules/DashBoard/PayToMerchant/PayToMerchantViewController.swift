//
//  PayToMerchantViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 07/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class PayToMerchantViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureUI()
    }

    //MARK:- Configure UI
    func configureUI() {
        self.navigationItem.title = "Pay to Merchant"
        
    }
    
}

