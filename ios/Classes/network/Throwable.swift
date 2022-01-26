//
//  ThrowbaleException.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation
extension Throwable {
    public var value: T? {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return nil
        }
    }
}

public enum Throwable<T: Decodable>: Decodable {
    case failure(Error)
    case success(T)

    public init(from decoder: Decoder) throws {
        do {
            let decoded = try T(from: decoder)
            self = .success(decoded)
        } catch {
            self = .failure(error)
        }
    }
}
