//
//  ErrorResponse.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation

@objc public class ErrorResponse: NSObject,
    Codable {
    public var message: String
    public var identifier: String?
    public var severity: String?

    init(message: String) {
        self.message = message
    }
}
