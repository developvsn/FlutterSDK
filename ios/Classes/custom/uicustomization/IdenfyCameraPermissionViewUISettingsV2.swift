//
//  IdenfyCameraPermissionViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-08-19.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyCameraPermissionViewUISettingsV2: NSObject {
    // Idenfy Identification Success Results View Colors

    public static var idenfyCameraPermissionViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyCameraPermissionViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyCameraPermissionViewDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyCameraPermissionViewGuidancePermissionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyCameraPermissionViewGoToSettingsButtonTextColor = IdenfyCommonColors.idenfyWhite

    // Idenfy Identification Success Results Fonts

    public static var idenfyCameraPermissionViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyCameraPermissionViewDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyCameraPermissionViewGuidanceDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 14)
}
