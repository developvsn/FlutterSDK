//
//  CustomDocumentType.swift
//  idenfy-sample-ios
//
//  Created by iMac 21 on 27/12/2021.
//  Copyright © 2021 Viktor Vostrikov. All rights reserved.
//

import Foundation

struct CustomDocumentType {
    var image: String
    var title: String
    var documentCode : [String]
    
    init(image: String, title: String, documentCode : [String]) {
        self.image = image
        self.title = title
        self.documentCode = documentCode
    }
}
