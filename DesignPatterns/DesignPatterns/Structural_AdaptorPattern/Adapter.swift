//
//  Adapter.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 25/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

//1. This is the interface for lightning phone
protocol LightningPhone {
    func recharge()
    func useLightning()
}

//2. This is the interface of a micro usb phone
protocol MicroUsbPhone {
    func recharge()
    func useMicroUsb()
}

// Both the above interface have a common feature recharge()

// Here we create an iphone having a lightening connector
final class Iphone: LightningPhone {
    
    private var connector: Bool = false
    
    func recharge() {
        if connector {
            print("Recharge Started")
            print("Recharge finished")
        } else {
            print("Connect Lightning first")
        }
    }
    
    func useLightning() {
        connector = true;
    }
}

// Here we create an android phone having a microusb connector
final class Android: MicroUsbPhone {
    
    private var connector: Bool = false
    
    func recharge() {
        if connector {
            print("Recharge Started")
            print("Recharge finished")
        } else {
            print("Connect MicroUsb first")
        }
    }
    
    func useMicroUsb() {
        connector = true
        print("MicroUsb connected")
    }
}

// Suppose the client wants to charge an iphone phone using a microusb connector. How can he do so ?

// We convert the interface of the iphone to make it suitable for charging using micro usb connector. For this we use an lightning->microUsb adaptor
final class LightningToMicroUsbAdapter: MicroUsbPhone {
    
    //1. First we take the instance of iphone whose interface we are about to change
    private var lightningPhone: LightningPhone
    
    init(lightningPhone: LightningPhone) {
        self.lightningPhone = lightningPhone
    }
    
    // recharge interface remains same to so we connect them as it is
    func recharge() {
        lightningPhone.recharge()
    }
    
    // Here we call uselightning of an iphone as microusb is connected for charging an iphone
    func useMicroUsb() {
        print("MicroUsb connected")
        lightningPhone.useLightning()
    }
}


