//
//  LoadMoneyViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 13/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class LoadMoneyViewController: UIViewController {

    @IBOutlet weak var amountTextField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        self.amountTextField.addDoneButtonOnKeyboard()
        self.navigationItem.title = "Load Money"
    }
    
    @IBAction func loadMoneyAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TransferNowViewController")
        self.navigationController?.push(vc, animated: true)
    }
}
