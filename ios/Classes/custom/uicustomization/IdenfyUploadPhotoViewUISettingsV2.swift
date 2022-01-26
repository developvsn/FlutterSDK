//
//  IdenfyUploadPhotoViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-02-12.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyUploadPhotoViewUISettingsV2: NSObject {
    // Idenfy Upload Photo View Colors

    public static var idenfyUploadPhotoViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyUploadPhotoViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyUploadPhotoViewDescriptionTextColor =
        IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyUploadPhotoViewCroppingBorderColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyUploadPhotoViewCroppingBackgroundColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyUploadPhotoViewCroppingBackgroundDimColor = IdenfyCommonColors.idenfyWhite.withAlphaComponent(0.3)
    public static var idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyUploadPhotoViewChooseAnotherPhotoButtonBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyUploadPhotoViewChooseAnotherPhotoButtonBorderColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyUploadPhotoViewContinuePhotoButtonTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyUploadPhotoViewCroppingRectangleGridColor = IdenfyCommonColors.idenfyWhite.withAlphaComponent(0.4)
    public static var idenfyUploadPhotoViewCroppingRectangleCornerColor = IdenfyCommonColors.idenfyWhite

    // Idenfy Upload Photo View Fonts

    public static var idenfyUploadPhotoViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyUploadPhotoViewDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)

    // Idenfy Upload Photo View Style

    public static var idenfyUploadPhotoViewCroppingViewBorderWidth = CGFloat(2)
    public static var idenfyUploadPhotoViewCroppingViewCornerRadius = CGFloat(3)
    public static var idenfyUploadPhotoViewCroppingRectangleCornerRadius = CGFloat(4)
    public static var idenfyUploadPhotoViewCroppingViewMinimumZoomScale = CGFloat(1)
    public static var idenfyUploadPhotoViewCroppingViewMaximumZoomScale = CGFloat(5)
}
