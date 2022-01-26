//
//  UserData.swift
//  idenfy-sample-ios
//
//  Created by iMac 21 on 27/12/2021.
//  Copyright © 2021 Viktor Vostrikov. All rights reserved.
//

import Foundation

class Singleton {

    var usersCountry: String?
    
    var usersDocument: [String]?
    
    var uiDocument : String?
    
    static var shared: Singleton = {
        let instance = Singleton()
        return instance
    }()

  
    private init() {}

   
}


extension Singleton: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
