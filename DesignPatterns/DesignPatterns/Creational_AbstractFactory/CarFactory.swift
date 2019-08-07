//
//  CarFactory.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 23/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

enum CarType {
    case mini
    case micro
    case luxary
}

enum Location {
    case india
    case usa
    case defaultLocation
}
// We connect to concrete factory 1/2/3 based on location read from GPS
// Factory 1:
final class IndiaCarFactory {
    
    static func buildCar(ofType type: CarType) -> Car {
        switch type {
        case .mini:
            return MiniCar(location: .india)
        case .micro:
            return MicroCar(location: .india)
        case .luxary:
            return LuxaryCar(location: .india)
        }
    }
}

// Factory 2:
final class USACarFactory {
    
    static func buildCar(ofType type: CarType) -> Car {
        switch type {
        case .mini:
            return MiniCar(location: .usa)
        case .micro:
            return MicroCar(location: .usa)
        case .luxary:
            return LuxaryCar(location: .usa)
        }
    }
}

// Factory 3:
final class DefaultCarFactory {
    
    static func buildCar(ofType type: CarType) -> Car {
        switch type {
        case .mini:
            return MiniCar(location: .defaultLocation)
        case .micro:
            return MicroCar(location: .defaultLocation)
        case .luxary:
            return LuxaryCar(location: .defaultLocation)
        }
    }
}

// This the common interface the client interacts with
final class CarFactory {
    
    // we add a private function here to read GPS location from device configuration internally
    // Client is not aware of this
    private static var location: Location = .usa
    
    // Client calls this method to get a car of a type
    static func buildCar(ofType type: CarType) -> Car {
        // Here based on the location identified  we internally use correct car factory implementation without even giving a single hint to user.
        // This also saves us from client calling wrong factory for a particular location.
        switch location {
            
        case .india:
            return IndiaCarFactory.buildCar(ofType: type)
            
        case .usa:
            return USACarFactory.buildCar(ofType: type)
            
        default:
            return DefaultCarFactory.buildCar(ofType: type)
        }
    }
}
