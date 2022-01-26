//
//  IdenfyPhotoResultViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-02-12.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyPhotoResultViewUISettingsV2: NSObject {
    // Idenfy Photo Results View Colors

    public static var idenfyPhotoResultViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyPhotoResultViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyPhotoResultViewDescriptionTextColor =
        IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyPhotoResultViewRetakePhotoButtonBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyPhotoResultViewRetakePhotoButtonTextColor = "#161617".hexColor
    public static var idenfyPhotoResultViewRetakePhotoButtonBorderColor = "#161617".hexColor.cgColor
//    public static var idenfyPhotoResultViewContinueButtonTextColor = "#FFFFFF".hexColor
    public static var idenfyPhotoResultViewPhotoBorderColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyPhotoResultViewDetailsCardBackgroundColor = IdenfyCommonColors.idenfyPhotoResultDetailsCardBackgroundColorV2
    public static var idenfyPhotoResultViewDetailsCardTitleColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyPhotoResultViewTitleColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyPhotoResultViewPoweredByIdenfyTitleColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.6)

    // Idenfy Photo Results View Fonts

    public static var idenfyPhotoResultViewTitleFont = UIFont.systemFont(ofSize: 24, weight: .medium)
    public static var idenfyPhotoResultViewDescriptionFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    public static var idenfyPhotoResultViewDetailsCardTitleFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    public static var idenfyPhotoResultViewPoweredByIdenfyTitleFont = UIFont.systemFont(ofSize: 12, weight: .regular)

    // Idenfy Photo Results View Style

    public static var idenfyPhotoResultViewPhotoBorderWidth = CGFloat(2)
    public static var idenfyPhotoResultViewPhotoCornerRadius = CGFloat(4)
    public static var idenfyPhotoResultViewDetailsCardCornerRadius = CGFloat(4)
}
