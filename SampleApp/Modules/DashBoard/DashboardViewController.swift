//
//  DashboardViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 03/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureUI()
    }
    
    func configureUI() {
        self.configureNavigationBar()
        self.addBackButton()
    }
    
    func configureNavigationBar() {
        let burgerMenuIcon = UIButton(type: .custom)
        burgerMenuIcon.setImage(UIImage(named: "burgerMenu"), for: .normal)
        burgerMenuIcon.addTarget(self, action: #selector(self.showSlideMenu), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: burgerMenuIcon)
    }
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "burgerMenu.png"), for: .normal) // Image can be downloaded from here below link
        backButton.setTitle("Menu", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal) // You can change the TitleColor
        backButton.addTarget(self, action: #selector(self.showSlideMenu), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    @IBAction func backAction(_ sender: UIButton) {
       let _ = self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showSlideMenu() {
        slideMenuController()?.openLeft()
    }
    
    @IBAction func showDetailView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailedViewController")
        self.navigationController?.push(vc, animated: true)
    }
}
