//
//  BillPaymentViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 08/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit
import iOSDropDown

enum BillPaymentItems: String {
    case MobileTopup = "Mobile Topup"
    case MobileBillPayment = "Mobile Bill Pay"
    case ElectricityBillPayment = "Electricity Bill Pay"
}

class BillPaymentViewController: UIViewController {
    var selectedItem = ""
    var serviceProvide = [""]
    var circle = [""]
    
    @IBOutlet weak var billNumberTextField : UITextField!
    @IBOutlet weak var serviceProviderDropDown : DropDown!
    @IBOutlet weak var circleDropDown : DropDown!
    @IBOutlet weak var amountTextField : UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureUI()
    }

//MARK:- Configure UI
    func configureUI() {
        self.configureTextfield()
        self.configureDropDownItems()
        
        let selectedItem =  BillPaymentItems(rawValue: self.selectedItem)
        switch selectedItem {
        case .MobileTopup:
            self.navigationItem.title = BillPaymentItems.MobileTopup.rawValue
            self.view.makeToast("Mobile Top-up selected",
                                duration: toastDuration,
                                position: .bottom)
            break
        case .MobileBillPayment:
            self.navigationItem.title = BillPaymentItems.MobileBillPayment.rawValue
            break
        case .ElectricityBillPayment:
            self.view.makeToast("Electricity bill payment selected",
                                duration: toastDuration,
                                position: .bottom)
            self.billNumberTextField.attributedPlaceholder = NSAttributedString(string: "Enter Consumer Number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            break
        default:
            print("Case Default")
            break
        }
    }
    
    func configureTextfield() {
        self.billNumberTextField.addDoneButtonOnKeyboard()
        self.amountTextField.addDoneButtonOnKeyboard()
    }
    
    func configureDropDownItems() {
        var serviceProvider = ""
        var circle = ""
        if (self.selectedItem == BillPaymentItems.ElectricityBillPayment.rawValue) {
            serviceProvider = "Electricity Board"
            circle = "City"
            
            self.serviceProviderDropDown.optionArray = ["Maha Vitran", "MSEB", "Relience"]
            self.circleDropDown.optionArray = ["Mumbai", "Thane", "Pune"]

        } else {
            serviceProvider = "Service Provider"
            circle = "Circle"
            
            self.serviceProviderDropDown.optionArray = ["Airtel", "Idea", "Vodafone"]
            self.circleDropDown.optionArray = ["Mumbai", "Thane"]
        }
        
        self.serviceProviderDropDown.attributedPlaceholder = NSAttributedString(string: serviceProvider, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.circleDropDown.attributedPlaceholder = NSAttributedString(string: circle, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
        
// MARK:- Action
    @IBAction func nextButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PaymentMethodViewController") as! PaymentMethodViewController
        let selectedItem =  BillPaymentItems(rawValue: self.selectedItem)
        switch selectedItem {
        case .MobileTopup:
            fatalError()
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
