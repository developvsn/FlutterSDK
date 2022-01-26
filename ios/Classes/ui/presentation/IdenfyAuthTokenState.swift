//
//  IdenfyAuthTokenState.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation
enum IdenfyAuthTokenState {
    case NotStarted
    case Loading
    case AuthTokenCouldNotBeReceived(error: String)
    case Success(authToken: AuthToken)
}
