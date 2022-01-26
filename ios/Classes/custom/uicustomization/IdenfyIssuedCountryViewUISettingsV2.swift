//
//  IdenfyIssuedCountryViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-03-09.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyIssuedCountryViewUISettingsV2: NSObject {
    // Idenfy Issued Country View Colors

    public static var idenfyIssuedCountryViewBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyIssuedCountryViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyIssuedCountryViewCountryViewBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyIssuedCountryViewDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyIssuedCountryViewCountryLabelTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyIssuedCountryViewCountryViewBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyIssuedCountryViewBeginIdentificationButtonTextColor = IdenfyCommonColors.idenfyWhite

    // Idenfy Issued Country View Fonts

    public static var idenfyIssuedCountryViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyIssuedCountryViewDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyIssuedCountryViewCountryLabelFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)

    // Idenfy Issued Country View Style

    public static var idenfyIssuedCountryViewCountryViewBorderWidth = CGFloat(2)
    public static var idenfyIssuedCountryViewCountryViewCorderRadius = CGFloat(3)
    public static var idenfyIssuedCountryViewCountryFlagBorderWidth = CGFloat(1)
}
