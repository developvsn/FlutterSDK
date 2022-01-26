//
//  IdenfyDocNotFoundAlertUISettigsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-04-29.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit

@objc open class IdenfyDocNotFoundAlertUISettigsV2: NSObject {
    // Doc Found Alert Colors
    public static var idenfyDocNotFoundAlertViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyDocNotFoundAlertCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocNotFoundAlertCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocNotFoundAlertContinueButtonTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocNotFoundAlertDescriptionHighlightedTextColor = IdenfyCommonColors.idenfyMainColorV2

    // Doc Found Alert Fonts
    public static var idenfyDocNotFoundAlertCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyDocNotFoundAlertCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyDocNotFoundAlertDescriptionHighlightedFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 14)
}
