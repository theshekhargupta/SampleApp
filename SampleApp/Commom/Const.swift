//
//  Const.swift
//  DHCollectionTableView
//
//  Created by Shekhar Gupta on 06/01/20.
//  Copyright © 2020 HuDahan_payMoreGainMore. All rights reserved.
//

import UIKit

let toastDuration = 0.8

struct APP_IMAGES {
    static let payToMerchant = "payMerchant.png"
    static let sendMoney = "sendMoney.png"
    static let mobileTopup = "mobileTopup.png"
    static let mobileBillPay = "mobileBill.png"
    static let electricityBill = "electricityBill.png"
    static let hotel = "hotel.png"
    static let cab = "cab.png"
    static let flight = "flight.png"
    static let train = "train.png"
    static let bus = "bus.png"
    static let movie = "movie.png"
    static let sports = "sports.png"
    static let profileSetting = "profileSetting.png"
    static let tabActivity = "profileSetting.png"
    static let paymentMethodMobile = "paymentModeMobile.png"
    static let paymentMethodElectricity = "paymentModeElectricity.png"
    static let mobileBill = "mobileReceipt.png"
    static let electricBill = "electricityReceipt.png"
}


let dataArray: Array<Any> = [
    [
        ["label": "Pay to Merchant", "image":APP_IMAGES.payToMerchant],
        ["label": "Send Money", "image":APP_IMAGES.sendMoney]
    ],
    [
        ["label": "Mobile Top-up", "image":APP_IMAGES.mobileTopup],
        ["label": "Mobile Bill Pay", "image":APP_IMAGES.mobileBillPay],
        ["label": "Electric Bill", "image":APP_IMAGES.electricityBill]
    ],
    [
        ["label": "Hotel", "image":APP_IMAGES.hotel],
        ["label": "Cab", "image":APP_IMAGES.cab],
        ["label": "Flight", "image":APP_IMAGES.flight],
        ["label": "Train", "image":APP_IMAGES.train],
        ["label": "Bus", "image":APP_IMAGES.bus],
        ["label": "Movie", "image":APP_IMAGES.movie],
        ["label": "Sports", "image":APP_IMAGES.sports],
    ],
    [
        ["label": "Profile Setting", "image":APP_IMAGES.profileSetting],
        ["label": "Tab Activity", "image":APP_IMAGES.profileSetting]
    ],
]

let sideMenuArray = [
    "Home",
    "Profile",
    "Recharge",
    "Bill Pay",
    "Send Money",
    "Manage Beneficiary",
    "Request Money",
    "Notification",
    "Offer",
    "Transaction History",
    "Help",
    "Sign Out"
]

struct SCREEN_SIZE { // Answer to OP's question

    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(SCREEN_SIZE.SCREEN_WIDTH, SCREEN_SIZE.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(SCREEN_SIZE.SCREEN_WIDTH, SCREEN_SIZE.SCREEN_HEIGHT)

}

struct DEVICE_TYPE { //Use this to check what is the device kind you're working with

    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SIZE.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_SE         = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SIZE.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_7          = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SIZE.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_7PLUS      = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SIZE.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SIZE.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && SCREEN_SIZE.SCREEN_MAX_LENGTH == 1024.0

}


struct iOS_VERSION { //Get current device's iOS version

    static let SYS_VERSION_FLOAT  = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7               = (iOS_VERSION.SYS_VERSION_FLOAT >= 7.0 && iOS_VERSION.SYS_VERSION_FLOAT < 8.0)
    static let iOS8               = (iOS_VERSION.SYS_VERSION_FLOAT >= 8.0 && iOS_VERSION.SYS_VERSION_FLOAT < 9.0)
    static let iOS9               = (iOS_VERSION.SYS_VERSION_FLOAT >= 9.0 && iOS_VERSION.SYS_VERSION_FLOAT < 10.0)
    static let iOS10              = (iOS_VERSION.SYS_VERSION_FLOAT >= 10.0 && iOS_VERSION.SYS_VERSION_FLOAT < 11.0)
    static let iOS11              = (iOS_VERSION.SYS_VERSION_FLOAT >= 11.0 && iOS_VERSION.SYS_VERSION_FLOAT < 12.0)
    static let iOS12              = (iOS_VERSION.SYS_VERSION_FLOAT >= 12.0 && iOS_VERSION.SYS_VERSION_FLOAT < 13.0)

}


func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 20
    let numberOfItemsPerRow = 20
    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}

extension UIColor {
    
    class func randomColor() -> UIColor {

        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100

        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}


func showToast(controller: UIViewController, message : String, seconds: Double) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.black
    alert.view.alpha = 0.6
    alert.view.layer.cornerRadius = 15

    controller.present(alert, animated: true)

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
        alert.dismiss(animated: true)
    }
}

