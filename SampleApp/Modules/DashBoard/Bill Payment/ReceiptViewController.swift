//
//  ReceiptViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 08/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {
    var selectedItem = ""
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    //MARK:- Configure UI
    func configureUI() {
        var currentImage = ""
        let selectedItem = BillPaymentItems(rawValue: self.selectedItem)
        switch selectedItem {
        case .MobileTopup:
            currentImage = APP_IMAGES.mobileBill
            self.navigationItem.title = BillPaymentItems.MobileTopup.rawValue
            break
        case .ElectricityBillPayment:
            currentImage = APP_IMAGES.electricBill
            self.navigationItem.title = BillPaymentItems.ElectricityBillPayment.rawValue
            break
        default:
            print("Case Default")
            break
        }
        let selectedImage = UIImage(named: currentImage)
        self.imageView.image = selectedImage
    }

    // MARK:- Action
    @IBAction func newPayment() {
        self.navigationController?.popToViewController(ofClass: BillPaymentViewController.self)
    }
    
    @IBAction func goHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}


