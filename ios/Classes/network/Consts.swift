//
//  Consts.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation
/**
  ///More about generating token: https://github.com/idenfy/Documentation/blob/master/pages/GeneratingIdentificationToken.md
 */
struct Consts {
    static let baseURL = "https://ivs.idenfy.com/"
    static let apiKey = "I05Q38OsGZ0"
    static let apiSecret = "cvWsNZfidWSBOdxO7HmD"
    static let clientId = "IdenfySampleClientID"
    static let sdkInitFlow: SDKInitFlow = SDKInitFlow.CustomWithImplementedViews
}

enum SDKInitFlow {
    case Default
    case CustomWithImplementedViews
}
