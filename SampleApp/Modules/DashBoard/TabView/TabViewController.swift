//
//  TabViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 07/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    //MARK:- Configure UI
    func configureUI() {
        self.navigationItem.title = "Tab Activity"
    }
}

