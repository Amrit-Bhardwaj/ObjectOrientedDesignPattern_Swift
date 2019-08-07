//
//  Carr.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 05/08/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

enum CarTypee {
    case cityCar
    case sportsCar
    case cabrioletCar
    case noType
}

class Carr {
    
    private var wheels: Int
    private var color: String
    private var hasGPS: Bool
    private var seatCount: Int
    private var carType: CarTypee
    private var hasTripComputer: Bool
    
    init() {
        self.wheels = 0
        self.color = "White"
        self.hasGPS = false
        self.carType = .noType
        self.seatCount = 0
        self.hasTripComputer = false
    }
    
    func getColor() -> String {
        return self.color
    }
    
    func setColor(color: String)  {
        self.color = color
    }
    
    func getWheels() -> Int {
        return self.wheels
    }
    
    func setWheels(wheels: Int) {
        self.wheels = wheels
    }
    
    func setGPS(value: Bool) {
        self.hasGPS = value
    }
    
    func hasGps() -> Bool {
        return self.hasGPS
    }
    
    func setCarType(type: CarTypee) {
        self.carType = type
    }
    
    func getCarType() -> CarTypee {
        return self.carType
    }
    
    func getSeatCount() -> Int {
        return self.seatCount
    }
    
    func setSeatCount(seatCount: Int) {
        self.seatCount = seatCount
    }
    
    func setTripComputer(value: Bool) {
        self.hasTripComputer = value
    }
    
    func hasTRipComputer() -> Bool {
        return self.hasTripComputer
    }
}

protocol CarBuilderProtocol: class {
    
    func construct() -> Carr
    
    func setColor(color: String) -> CarBuilderProtocol
    
    func setWheels(wheels: Int) -> CarBuilderProtocol
    
    func setGPS(value: Bool) -> CarBuilderProtocol

    func setSeatCount(count: Int) -> CarBuilderProtocol
    
    func setTRipComputer(value: Bool) -> CarBuilderProtocol
    
    func setCarType(type: CarTypee) -> CarBuilderProtocol
}

class CarBuilder: CarBuilderProtocol {
    
    private var carTmp: Carr
    
    init() {
        carTmp = Carr()
    }
    
    func construct() -> Carr {
        let car = Carr()
        car.setColor(color: carTmp.getColor())
        car.setWheels(wheels: carTmp.getWheels())
        car.setCarType(type: carTmp.getCarType())
        car.setTripComputer(value: carTmp.hasTRipComputer())
        car.setSeatCount(seatCount: carTmp.getSeatCount())
        car.setGPS(value: carTmp.hasGps())
        return car
    }
    
    func setCarType(type: CarTypee) -> CarBuilderProtocol {
        carTmp.setCarType(type: type)
        return self
    }
    
    func setGPS(value: Bool) -> CarBuilderProtocol {
        carTmp.setGPS(value: value)
        return self
    }
    
    func setSeatCount(count: Int) -> CarBuilderProtocol {
        carTmp.setSeatCount(seatCount: count)
        return self
    }
    
    func setTRipComputer(value: Bool) -> CarBuilderProtocol {
        carTmp.setTripComputer(value: value)
        return self
    }
    
    func setColor(color: String) -> CarBuilderProtocol {
        carTmp.setColor(color: color)
        return self
    }
    
    func setWheels(wheels: Int) -> CarBuilderProtocol {
        carTmp.setWheels(wheels: wheels)
        return self
    }
}
