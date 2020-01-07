//
//  ComingSoonViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 07/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

enum SelectedItem: String {
    case hotel
    case cab
    case flight
    case train
    case bus
}


class ComingSoonViewController: UIViewController {
    
    var selectedView = ""
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI(selectedView)
    }

    //MARK:- Configure UI
    func configureUI(_ selectedItem: String) {
        var currentImage = ""
        let selectedItem =  SelectedItem(rawValue: selectedItem)
        switch selectedItem {
        case .hotel:
            currentImage = APP_IMAGES.hotel
            break
        case .cab:
            currentImage = APP_IMAGES.cab
            break
        case .flight:
            currentImage = APP_IMAGES.flight
            break
        case .train:
            currentImage = APP_IMAGES.train
            break
        case .bus:
            currentImage = APP_IMAGES.bus
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
