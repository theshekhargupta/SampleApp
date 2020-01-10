//
//  ComingSoonViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 07/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

enum BookingItems: String {
    case Hotel = "Hotel"
    case Cab = "Cab"
    case Flight = "Flight"
    case Train = "Train"
    case Bus = "Bus"
}


class ComingSoonViewController: UIViewController {
    
    var selectedItem = ""
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var hotelListView: UIView!
    var tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    func configureUI() {
        self.navigationItem.title = "Coming Soon"
        self.configureUIElements()
        
        if (selectedItem == BookingItems.Hotel.rawValue) {
            self.hotelListView.isHidden = false
            self.configureTableView()
        }
    }

    //MARK:- Configure UI
    func configureUIElements() {
        var currentImage = ""
        let selectedItem =  BookingItems(rawValue: self.selectedItem)
        switch selectedItem {
        case .Hotel:
            currentImage = APP_IMAGES.hotel
            self.navigationItem.title = BookingItems.Hotel.rawValue
            break
        case .Cab:
            currentImage = APP_IMAGES.cab
            self.navigationItem.title = BookingItems.Cab.rawValue
            break
        case .Flight:
            self.view.makeToast("Flight booking feature coming soon!",
                                duration: toastDuration,
                                position: .bottom)
            currentImage = APP_IMAGES.flight
            self.navigationItem.title = BookingItems.Flight.rawValue
            break
        case .Train:
            self.view.makeToast("Train booking feature coming soon!",
                                duration: toastDuration,
                                position: .bottom)
            currentImage = APP_IMAGES.train
            self.navigationItem.title = BookingItems.Train.rawValue
            break
        case .Bus:
            currentImage = APP_IMAGES.bus
            self.navigationItem.title = BookingItems.Bus.rawValue
            break
        default:
            print("Case Default")
            break
        }
        
        let selectedImage = UIImage(named: currentImage)
        self.imageView.image = selectedImage
    }
    
    @IBAction func goToHome() {
        self.navigationController?.pop(animated: true)
    }
    
}

extension ComingSoonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        self.tableView.frame = CGRect(x: 0,
                                      y: 0,
                                      width: self.hotelListView.frame.size.width,
                                      height: self.hotelListView.frame.size.height)
        self.hotelListView.addSubview(tableView)
        self.tableView.backgroundColor = .clear
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK - UITableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }

        cell?.textLabel!.text = "Hotel \(indexPath.row + 1)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Info",
                                      message: "Hotel \(indexPath.row + 1) selected!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: { (action: UIAlertAction!) in
          print("Handle Ok logic here")
          }))

        self.present(alert, animated: true)
    }
}
