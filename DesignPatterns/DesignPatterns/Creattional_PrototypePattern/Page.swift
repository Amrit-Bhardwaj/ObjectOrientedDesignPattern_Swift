//
//  Color.swift
//  DesignPatterns
//
//  Created by Bhardwaj, Amrit Dilip on 24/07/19.
//  Copyright © 2019 Bhardwaj, Amrit Dilip (US - Bengaluru). All rights reserved.
//

import Foundation

// We use this pattern when the object creation is a heavy process.
// The concept is to copy an existing object rather than creating a new instance from scratch, something that may include costly operations
// Existing Object = is a prototype and contains the state of the object
// newly copied Object = Change same properties only if required. We se clone method to create a new copy of the object as per business model

class Page {
    
    private(set) var pageTitle: String
    private(set) var contents: String
    private(set) var author: String
    
    init(title: String, contents: String, author: String) {
        self.pageTitle = title
        self.contents = contents
        self.author = author
    }
    
    // Here we create a new clone of Page object by initializing its properties with its existing values
    func clone() -> Page {
        let prototypePage = Page(title: self.pageTitle, contents: self.contents, author: self.author)
        print("The page property values have been copied to create a new clone of Page object\n")
        return prototypePage
    }
}


// We are subclassing the Page base class and overriding the clone method if we want to add addtional properties to the cloned Page object
final class MyPage: Page {
    
    private var pageNumber: Int = 2
    
    // Overriding clone method to add a new property pageNumber to the clone
    override func clone() -> Page {
        self.pageNumber = 10
        return self
    }
}


