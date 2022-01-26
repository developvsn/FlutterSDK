//
//  CommonExtensions.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation
import UIKit
extension String {
    func localized(_: String? = nil) -> String {
        let appBundle = Bundle.main
        let localizedString = NSLocalizedString(self, tableName: nil, bundle: appBundle, value: "", comment: "")
        return localizedString
    }
}

extension UIButton {
    func applyButtonGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

public struct FontsLoader {
    static func registerFont(with fontName: String) {
        guard let url = Bundle(for: BundleToken.self).url(forResource: fontName, withExtension: nil),
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil) else {
            #if DEBUG
                print("Failed to register font: \(fontName)")
            #endif
            return
        }
    }

    private final class BundleToken {}
}
