//
//  Vehicle.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 25/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

// This is a workshop interface. It is the interface of one of the dimensions of vehicles a user
protocol Workshop: class {
    func work()
}

// This is vehicle interface
protocol Vehicle: class {
    
    // These two references are the bridges to the two dimensions(functionalities- vehicles can be produced, vehicles can be assembled) the vehicles have
    // For every new functionality, we have a reference here to its interface(Protocol), We create a protcol for a functionality and classes conform to this protocol for concrete implementattion
    var workshop1: Workshop { get set }
    var workshop2: Workshop { get set }
    
    init(workshop1: Workshop, workshop2: Workshop)
    
    func manufacture()
}

// Concrete implementation of object interface
class Caar: Vehicle {
    
    var workshop1: Workshop
    var workshop2: Workshop
    
    required init(workshop1: Workshop, workshop2: Workshop) {
        self.workshop1 = workshop1
        self.workshop2 = workshop2
    }
    
    func manufacture() {
        print("Caar..\n")
        workshop1.work()
        workshop2.work()
    }
}

// Concrete implementation of Object interface
class Bike: Vehicle {
    
    var workshop1: Workshop
    var workshop2: Workshop
    
    required init(workshop1: Workshop, workshop2: Workshop) {
        self.workshop1 = workshop1
        self.workshop2 = workshop2
    }
    
    func manufacture() {
        print("Bike...\n")
        workshop1.work()
        workshop2.work()
    }
}

// Concrete implementation of functionality interface, This guy is the real implementor
class Produce: Workshop {
    
    func work() {
        print("Produced")
    }
}

// Concrete implementation of functionality interface, This guy is the real implementor
class Assemble: Workshop {
    
    func work() {
       print("And Assembled")
    }
}
