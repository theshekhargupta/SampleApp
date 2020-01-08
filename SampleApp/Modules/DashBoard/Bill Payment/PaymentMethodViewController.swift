//
//  PaymentMethodViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 08/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class PaymentMethodViewController: UIViewController {
    var selectedItem = ""
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }


    //MARK:- Configure UI
    func configureUI() {
        var currentImage = ""
        let selectedItem = BillPaymentItems(rawValue: self.selectedItem)
        switch selectedItem {
        case .MobileTopup:
            currentImage = APP_IMAGES.paymentMethodMobile
            self.navigationItem.title = BillPaymentItems.MobileTopup.rawValue
            break
        case .ElectricityBillPayment:
            currentImage = APP_IMAGES.paymentMethodElectricity
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
    @IBAction func payButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ReceiptViewController") as! ReceiptViewController

        let selectedItem = BillPaymentItems(rawValue: self.selectedItem)
        switch selectedItem {
        case .MobileTopup:
            vc.selectedItem = BillPaymentItems.MobileTopup.rawValue
            break
        case .ElectricityBillPayment:
            vc.selectedItem = BillPaymentItems.ElectricityBillPayment.rawValue
            break
        default:
            print("Case Default")
            break
        }
        if vc.selectedItem != "" {
            self.navigationController?.push(vc, animated: true)
        }
    }

}


