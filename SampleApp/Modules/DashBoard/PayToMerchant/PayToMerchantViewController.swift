//
//  PayToMerchantViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 07/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit
import TZSegmentedControl

class PayToMerchantViewController: UIViewController {
    
    @IBOutlet var qrCodeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureUI()
    }

    //MARK:- Configure UI
    func configureUI() {
        self.view.makeToast("Pay to merchant selected",
                            duration: toastDuration,
                            position: .bottom)
        self.navigationItem.title = "Pay to Merchant"
        self.configureSegmentControl()
    }
    
    func configureSegmentControl() {
        let titleCont = TZSegmentedControl(sectionTitles: ["SCAN CODE","MOBILE"])
        titleCont.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.view.frame.width,
                                 height: self.view.frame.height/11)
        titleCont.indicatorWidthPercent = 0.8
        let whitishColor = UIColor(white: 0.75, alpha: 1.0)
        titleCont.backgroundColor = UIColor.systemBlue
        titleCont.borderType = .none
        titleCont.borderColor = whitishColor
        titleCont.borderWidth = 0.5
        titleCont.segmentAlignment = .edge
        titleCont.segmentWidthStyle = .fixed
        titleCont.verticalDividerEnabled = false
        titleCont.verticalDividerWidth = 0.5
        titleCont.verticalDividerColor = whitishColor
        titleCont.selectionStyle = .fullWidth
        titleCont.selectionIndicatorLocation = .down
        titleCont.selectionIndicatorColor = .red
        titleCont.selectionIndicatorHeight = 2.0
        titleCont.edgeInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        titleCont.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor :UIColor.white]
        titleCont.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.lightGray,
                                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        self.view.addSubview(titleCont)
        
        titleCont.indexChangeBlock = { (index) in
            debugPrint("Segmented \(titleCont.sectionTitles[index]) is visible now")
            
            if(index == 0) {
                self.qrCodeView.isHidden = false
            } else {
                self.qrCodeView.isHidden = true
            }
        }
    }
}

