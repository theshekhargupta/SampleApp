//
//  BillPaymentViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 08/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

enum BillPaymentItems: String {
    case MobileTopup = "Mobile Topup"
    case MobileBillPayment = "Mobile Bill Pay"
    case ElectricityBillPayment = "Electricity Bill Pay"
}

class BillPaymentViewController: UIViewController {
    var selectedItem = ""
    @IBOutlet var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureUI()
    }

//MARK:- Configure UI
    func configureUI() {
        let selectedItem =  BillPaymentItems(rawValue: self.selectedItem)
        switch selectedItem {
        case .MobileTopup:
            self.navigationItem.title = BillPaymentItems.MobileTopup.rawValue
            break
        case .MobileBillPayment:
            self.navigationItem.title = BillPaymentItems.MobileBillPayment.rawValue
            break
        case .ElectricityBillPayment:
            self.navigationItem.title = BillPaymentItems.ElectricityBillPayment.rawValue
            break
        default:
            print("Case Default")
            break
        }
    }
    
// MARK:- Action
    @IBAction func nextButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PaymentMethodViewController") as! PaymentMethodViewController
        let selectedItem =  BillPaymentItems(rawValue: self.selectedItem)
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