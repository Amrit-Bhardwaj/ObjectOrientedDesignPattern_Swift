//
//  Car.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 23/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

class Car {
    init(location: Location, type: CarType) {
        print("Car object Created")
    }
}

final class MiniCar: Car {
    
    init(location: Location) {
        super.init(location: location, type: .mini)
         print("MiniCar created at \(location)")
    }
}

final class MicroCar: Car {
    
    init(location: Location) {
        super.init(location: location, type: .micro)
        print("MicroCar created at \(location)")
    }
}

final class LuxaryCar: Car {
    
    init(location: Location) {
        super.init(location: location, type: .luxary)
         print("LuxaryCar created at \(location)")
    }
}


