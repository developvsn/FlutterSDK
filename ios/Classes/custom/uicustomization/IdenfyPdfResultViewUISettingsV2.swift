//
//  IdenfyPdfResultViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-06-16.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyPdfResultViewUISettingsV2: NSObject {
    // Idenfy PDF Results View Colors

    public static var idenfyPdfResultViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyPdfResultViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyPdfResultViewRetakePdfButtonBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyPdfResultViewRetakePdfButtonTextColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyPdfResultViewRetakePdfButtonBorderColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyPdfResultViewContinueButtonTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyPdfResultViewDetailsCardBackgroundColor = IdenfyCommonColors.idenfyPhotoResultDetailsCardBackgroundColorV2
    public static var idenfyPdfResultViewDetailsCardTitleColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyPdfResultViewTitleColor = IdenfyCommonColors.idenfySecondColorV2

    // Idenfy PDF Results View Fonts

    public static var idenfyPdfResultViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 20)
    public static var idenfyPdfResultViewDetailsCardTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 12)

    // Idenfy PDF Results View Style

    public static var idenfyPdfResultViewDetailsCardCornerRadius = CGFloat(4)
}
