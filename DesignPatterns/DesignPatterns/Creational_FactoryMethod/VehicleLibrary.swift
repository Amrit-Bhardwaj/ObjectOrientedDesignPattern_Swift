//
//  Library.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 23/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation
// This is a vehicle library

enum Type {
    case twoWheeler
    case threeWheeler
    case fourWheeler
    case sixWheeler
}

class VehicleLibrary {
    
    func printVehicle() {
        print("I am a vehicle Library")
    }
    
    // Factory method to create objects of different types.
    // Change is required only in this function to create a new object type(say a SixWheeler truck)
    static func createVehicle(ofType type: Type) -> VehicleLibrary {
        if type == .twoWheeler {
            return TwoWheeler()
        } else if type == .threeWheeler {
            return ThreeWheeler()
        } else if type == .fourWheeler{
            return FourWheeler()
        } else {
            return SixWheeler()
        }
    }
}

final class TwoWheeler: VehicleLibrary {
    
    override func printVehicle() {
        print("I am a two wheeler")
    }
}

final class ThreeWheeler: VehicleLibrary {
    
    override func printVehicle() {
        print("I am a three wheeler")
    }
}

final class FourWheeler: VehicleLibrary {
    
    override func printVehicle() {
        print("I am a four wheeler")
    }
}

final class SixWheeler: VehicleLibrary {
    
    override func printVehicle() {
        print("I am a six wheeler")
    }
}
