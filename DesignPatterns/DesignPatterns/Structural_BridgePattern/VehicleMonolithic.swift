//
//  VehicleMonolithic.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 26/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

// This a monolithic class implementation where each dimension adds a new class hierarchy
// So the class hierarchy increases in Geometric Progression for every new functionality added

class VehicleMonolothic {
    
    // Vehicle methods
}

class Caaar: VehicleMonolothic {
    // car methods
}

class Baike: VehicleMonolothic {
    // Bike methods
}

// Functionality 1: Produce, for the Car
class ProduceCaar: Caaar {
    
    func produce() {
        print("Car Produced\n")
    }
}

// Functionality 2: Assemble, for the car
class AssembleCaar: Caaar {
    
    func assemble() {
        print("Assemble Car\n")
    }
}

// Functionality 1: Produce, for a Bike
class ProduceBike: Bike {
    
    func produce() {
        print("Bike Produced\n")
    }
}

// Functionality 2: Assemble, for a Bike
class AssembleBike: Bike {
    
    func assemble() {
        print("Assemble Bike\n")
    }
}
