//
//  AbstractClass.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 25/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

//1. Abstract class without using protocols
class AbstractClass1 {
    
    // Below is the empty implementation of abstract methods
    func abstractMethodA() { }
    func abstractMethodB() { }
    func abstractMethodC() { }
}

class CustomClass1: AbstractClass1 {
    
    override func abstractMethodA() {
        // Provide the cusktom implementation for abstractMethodA
    }
    
    override func abstractMethodB() {
        // Provide the cusktom implementation for abstractMethodB
    }
    
    override func abstractMethodC() {
        // Provide the cusktom implementation for abstractMethodC
    }
}

//2. Abstract class using protocols in swift
protocol AbstractClass2 {
    
     // Below is the abstract methods to be implemented by the class which conforms to protocol
    func abstractMethodA()
    func abstractMethodB()
    func abstractMethodC()
}

class CustomClass2: AbstractClass2 {
    
    func abstractMethodA() {
        // Provide the cusktom implementation for abstractMethodA
    }
    
    func abstractMethodB() {
        // Provide the cusktom implementation for abstractMethodB
    }
    
    func abstractMethodC() {
        // Provide the cusktom implementation for abstractMethodC
    }
}
