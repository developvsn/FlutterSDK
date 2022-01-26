//
//  IdenfyViewsUtils.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation
import UIKit

enum ResourceType: String {
    case mp4
    case json
}

class IdenfyViewUtils {
    static let identifier = "com.idenfy.idenfyviews"

    /// Returns the path for resource for the provided name and type. Returns nil if no path is found.
    static func getResourcePath(name: String, type: ResourceType) -> String? {
        var path = Bundle.main.path(forResource: name, ofType: type.rawValue)

        if path == nil {
            path = Bundle(identifier: IdenfyViewUtils.identifier)!.path(forResource: name, ofType: type.rawValue)
        }
        return path
    }

    static func getImage(_ name: String) -> UIImage {
        var image: UIImage?

        if let imageFromAssets = UIImage(named: name, in: Bundle.main, compatibleWith: nil) {
            image = imageFromAssets
        } else {
            image = UIImage(named: name, in: Bundle(identifier: identifier
            ), compatibleWith: nil)
        }
        return image!
    }
}
