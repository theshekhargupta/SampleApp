//
//  ViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 03/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureUI()
    }

    //MARK:- Configure UI
    func configureUI() {
        self.configureTextField()
        self.configureButton()
    }
    
    func configureTextField() {
        self.textField.placeHolderColor = UIColor.white
        self.textField.addDoneButtonOnKeyboard()
    }
    
    func configureButton() {
        if #available(iOS 11.0, *) {
            self.loginButton.clipsToBounds = true
            self.loginButton.layer.cornerRadius = 5
            self.loginButton.layer.borderColor = UIColor.white.cgColor
            self.loginButton.layer.borderWidth = 1.5
        }
    }
    
    //MARK:- Navigation
    @IBAction func showDashboardView() {
        let scene = UIApplication.shared.connectedScenes.first
        if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
            sd.showDashboard()
        }        
    }
    

}

