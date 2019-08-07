//
//  Client.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 23/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

// This is a client class
// Client creates objects of either TwoWheeler or ThreeWheeler based on some input during constructing its object


// 2. Abstract Factory pattern:  It is almost similar to Factory Pattern. It is another layer of abstraction over factory pattern.
// Abstract Factory patterns work around a super-factory which creates other factories
//  At runtime, Abstract factory is coupled with any desired concrete factory which can create objects of desired type.
// CarFactory object has 3 factory methods inside it
// Clients manipulate instances through their abstract interfaces

final class Client {
    
    var vehicle: VehicleLibrary?
    var car: Car?
    var pageOriginal: Page?
    var pageClone: Page?
    var carr: Carr?
    
    // bad implementation:
    // if library introduces a new class FourWheeler to incorporate four wheeler vehicles, client class will have to chain a new else case. This will require client to be recompiled.
    // So each time a change is made in library side, client would need to make the corresponding changes and recompile the code. This is bad practice.
    
//    init(vehicleType: Type) {
//        if vehicleType == .twoWheeler {
//            vehicle = TwoWheeler()
//        } else if vehicleType == .threeWheeler {
//            vehicle = ThreeWheeler()
//        } else {
//            vehicle = FourWheeler()
//        }
//    }
    
    // Better Implementation:
    // Client does not create vehicle objects explicitly
    // if library adds a new type, the client code is not recompiled again
    // Client just needs to make call to library’s static factory Create vehicle method and pass the type it wants, without worrying about the actual implementation of creation of objects
    
    // CREATIONAL PATTERN
    
    //1. Factory Method
    func buildVehicle() {
        vehicle = VehicleLibrary.createVehicle(ofType: .sixWheeler)
    }
    
    //2. Abstract Factory method
    func buildCar() {
        self.car = CarFactory.buildCar(ofType: .luxary)
    }
    
    //3. Builder pattern used to build a complex object-Carr
    func buildCarr() {
        let builder = CarBuilder()
        self.carr = builder.setColor(color: "Red").setWheels(wheels: 4).setGPS(value: true).setCarType(type: .cabrioletCar).setSeatCount(count: 5).setTRipComputer(value: true).construct()
    }
    
    //4. Prototype pattern
    func buildPageClone() {
        let page = Page(title: "C1", contents: "B1", author: "CB")
        
        let clonedPage = page.clone()
        
    }
    
    //5. Singleton design pattern
    func getSharedInstance() {
        let singleton = Singleton.shared
        print(singleton.title)
        print(singleton.subTitle)
    }
    
    // STRUCTURAL PATTERN: used to scale your application
    // 6. Adaptor pattern: The adapter pattern convert the interface of a class into another interface that clients expects
    // For example consider a USB to Ethernet adapter. We need this when we have an Ethernet interface on one end and USB on the other. Since they are incompatible with each other. we use an adapter that converts one to other.
    // Adapters are used when we have a class (Client) expecting some type of object A(having interface IA) and we have an object (Adaptee) B offering the same features as A but exposing a different interface(IB). here we use an adaptor to change the interface  IB of object B to meet the client expectation IA
    // It converts the interface of a class into another interface clients expect
    // It lets classes(having similar features) work together that couldn’t do otherwise because of incompatible interfaces
    // There are two types of adapter pattern: 1. Object Adapter Pattern 2. Class Adapter Pattern
    // We implement OBject Adapter Pattern(requires protocols)
    // We cant implement class Adapter pattern(because it requires multiple inheritence, adapter class inherits the adaptee class)
    func rechargeMicroUsbPhone(phone: MicroUsbPhone) {
        //1. connect micro usb
        phone.useMicroUsb()
        
        //2. recharge started
        phone.recharge()
    }
    
    func rechargeLightningPhone(phone: LightningPhone) {
        //1. connect lightning
        phone.useLightning()
        
        //2. recharge started
        phone.recharge()
    }
    
    func performDeviceCharging() {
        
        // here we have an iphone and an android phone
        let androidPhone = Android()
        let iPhone = Iphone()
        
        // lets recharge an android phone with a microusb connector
        
        print("Recharging android with micro usb")
        rechargeMicroUsbPhone(phone: androidPhone)
        
        // lets recharge an Iphone with a lightening connector
        
        print("Rechargning iphone with Lightning")
        rechargeLightningPhone(phone: iPhone)
        
        print("Recharging iPhone with a micro usb")
        
        // lets recharge an iphone using a micro usb connector
        
        // To do this first we connect the iphone with an adaptor
        rechargeMicroUsbPhone(phone: LightningToMicroUsbAdapter(lightningPhone: iPhone))
    }
    
    
    // Swift does not support Abstract classes. Instead we can create a class A with empty method implementation. Then we can subclass this class A to create a custom class B and override the methods of class A to provide custom class B implementation
    // A caveat= No compile time error is thrown if custom class B misses to override any method in class A(Abstract class here)
    
    //7. Bridge Pattern: is used to divide a monolithic(one concrete) class having various dimensions(several variants of some functionality) into separate class hierarchy
    // So we have a separate class hierarchy for each of the independent dimensions
    // The original base class has a reference to the class hierarchy of each dimension
    func bridgePattern() {
        // Good Implementation
//        let vehicle1 = Caar(workshop1: Produce(), workshop2: Assemble())
//        vehicle1.manufacture()
//        let vehicle2 = Bike(workshop1: Produce(), workshop2: Assemble())
//        vehicle2.manufacture()
    }
    
    func prepareCoffee() {
        // This is a simple coffee object which is undecorated
        let coffee1 = SimpleCoffee()
        print("The cost of simple coffee is : \(coffee1.getCost())\n")
        
        // This is a simple coffee object to which we are adding milk only
        // The attributes of the coffee are unaffected
        let coffee2 = SimpleCoffee()
        let coffeeWithMilk2 = WithMilk(coffee: coffee2)
        print("The cost of coffee with milk is : \(coffeeWithMilk2.getCost())\n")
        
        // This is a simple coffee object to which we are adding sprinkles only
        // The attributes of the coffee are unaffected
        let coffee3 = SimpleCoffee()
        let coffeeWithSprinkles3 = WithSprinkles(coffee: coffee3)
        print("The cost of coffee with sprinkles is : \(coffeeWithSprinkles3.getCost())\n")
        
        // This is a simple coffee object which we are adding both milk and sprinkles
        // The attributes of the coffee are unaffected
        let coffee4 = SimpleCoffee()
        let coffeeWithMilk4 = WithMilk(coffee: coffee4)
        let coffeeWithMilkAndSprinkles4 = WithSprinkles(coffee: coffeeWithMilk4)
        print("The cost of coffee with milk and sprinkles is : \(coffeeWithMilkAndSprinkles4.getCost())")
        
        // draw a pizza topping example to illustrate this design pattern
        
        
        // CREATIONAL PATTERN HAS TO DO ONLY WITH HOW DO WE SET THE PROPERTIES/ATTRIBUTES OF THE OBJECT WHILE ITS CREATION
        
        // STRUCTURAL PATTERN HAS TO DO WITH HOW WE ADD/REMOVE/CHANGE/UPDATE THE INTERFACE/METHODS OF THE OBJECT AFTER IT IS CREATED
        
        // BEHAVIORAL PATTERN HAS TO DO WITH HOW TWO OBJECTS, AFTER GETTING CREATED(PROPERTIES ARE SET) AND AFTER ITS INTERFACE IS SET, INTERACT WITH/SEND MESSAGES TO EACH OTHER
    }
}
