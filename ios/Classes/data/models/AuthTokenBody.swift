//
//  AuthTokenBody.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation
struct AuthTokenBody: Codable {
    let clientId: String
    let country: String
    let documents: Array<String>
    var firstName: String? = nil
    var lastName: String? = nil
    var countrt: String? = nil
}
