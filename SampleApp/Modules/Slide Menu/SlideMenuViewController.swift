//
//  SlideMenuViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 03/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var yourTableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureUI()
    }

    func configureUI() {
        self.configureTableView()
    }

    func configureTableView() {
        self.yourTableView.frame = CGRect(x: 10, y: 10, width: self.view.frame.size.width - 150, height: self.view.frame.size.height - 100)
        self.view.addSubview(yourTableView)
        self.yourTableView.backgroundColor = .clear
        self.yourTableView.dataSource = self
        self.yourTableView.delegate = self
        self.yourTableView.separatorColor = .clear
    }

    // MARK - UITableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuArray.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }

        cell?.backgroundColor = .clear
        if sideMenuArray.count > 0 {
            cell?.textLabel!.text = sideMenuArray[indexPath.row]
        }

        return cell!
    }

}
