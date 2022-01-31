//
//  IdenfyToolbarUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-02-12.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyToolbarUISettingsV2: NSObject {
    // Idenfy Default Toolbar Colors
    public static var idenfyDefaultToolbarBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDefaultToolbarShadowColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDefaultToolbarShadowOpacity = Float(0.0)
    public static var idenfyDefaultToolbarShadowRadius = CGFloat(0)

    public static var idenfyDefaultToolbarBackIconTintColor: UIColor? = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyDefaultToolbarLogoIconTintColor: UIColor? = IdenfyCommonColors.idenfyMainColorV2

    // Idenfy Camera Preview Session View Toolbar Colors
    public static var idenfyCameraPreviewSessionToolbarBackgroundColor = UIColor.clear
    public static var idenfyCameraPreviewSessionToolbarBackIconTintColor: UIColor? = IdenfyCommonColors.idenfyMainColorV2

    // Idenfy Language Selection View Toolbar Colors
    public static var idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor: UIColor? = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyLanguageSelectionToolbarCloseIconTintColor: UIColor? = IdenfyCommonColors.idenfyMainColorV2
}
