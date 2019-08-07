//
//  Singleton.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 24/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

//The singleton pattern is a design pattern that restricts the instantiation of a class to one object
// Used to create a db connection or a configuration manager or an error manager

class Singleton {
    
    private(set) var title: String
    private(set) var subTitle: String
    
    // Here we create singleton object as a static property of the class. So Access this property from different threads(say thread1, thread2) gives the same instance of singleton class
    static var shared = Singleton()
    
    private init() {
        self.title = "Title"
        self.subTitle = "SubTitle"
    }
}
