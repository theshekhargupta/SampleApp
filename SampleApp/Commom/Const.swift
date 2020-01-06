//
//  Const.swift
//  DHCollectionTableView
//
//  Created by Shekhar Gupta on 06/01/20.
//  Copyright © 2020 HuDahan_payMoreGainMore. All rights reserved.
//

import UIKit

struct IMAGES {
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
}


let dataArray: Array<Any> = [
    [
        ["label": "Pay to Merchant", "image":IMAGES.payToMerchant],
        ["label": "Send Money", "image":IMAGES.sendMoney]
    ],
    [
        ["label": "Mobile Top-up", "image":IMAGES.mobileTopup],
        ["label": "Mobile Bill Pay", "image":IMAGES.mobileBillPay],
        ["label": "Electric Bill", "image":IMAGES.electricityBill]
    ],
    [
        ["label": "Hotel", "image":IMAGES.hotel],
        ["label": "Cab", "image":IMAGES.cab],
        ["label": "Flight", "image":IMAGES.flight],
        ["label": "Train", "image":IMAGES.train],
        ["label": "Bus", "image":IMAGES.bus],
        ["label": "Movie", "image":IMAGES.movie],
        ["label": "Sports", "image":IMAGES.sports],
    ],
    [
        ["label": "Profile Setting", "image":IMAGES.profileSetting],
        ["label": "Tab Activity", "image":IMAGES.profileSetting]
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
