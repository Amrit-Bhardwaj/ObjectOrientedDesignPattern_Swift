//
//  Coffee.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 07/08/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

// The coffee interface defining the functionality of a simple coffee
protocol Coffee {
    
    func getCost() -> Double
    
    func getIngredients() -> String
}

// This is the Simple coffee implementation
class SimpleCoffee: Coffee {
    
    func getCost() -> Double {
        return 1
    }
    
    func getIngredients() -> String {
        return "Coffee"
    }
}

// Now we add extra ingredient(milk) to a Simple Coffee object without subclass SimpleCoffee class
class WithMilk: Coffee {
    
    private var decoratedCoffee: Coffee
    
    // Passing a simple coffee object to be decorated with milk
    init(coffee: Coffee) {
        self.decoratedCoffee = coffee
    }
    
    func getCost() -> Double {
        // Adding new cost of a coffee with milk
        return decoratedCoffee.getCost() + 0.5
    }
    
    func getIngredients() -> String {
        // Adding new ingredient milk to simple coffee object
        return decoratedCoffee.getIngredients() + ", Milk"
    }
}

// Now we add extra ingredient(Sprinkles) to a simple coffee object without subclassing SimpleCoffee class
class WithSprinkles: Coffee {
    
    private var decoratedCoffee: Coffee
    
    // passing a simple coffee object to be decorated with sprinkles
    init(coffee: Coffee) {
        self.decoratedCoffee = coffee
    }
    
    func getCost() -> Double {
        // Adding new cost of a coffee with Sprinkles
        return decoratedCoffee.getCost() + 0.2
    }
    
    func getIngredients() -> String {
        // Adding new ingredient sprinkles to simple coffee object
        return decoratedCoffee.getIngredients() + ", Sprinkles"
    }
}

