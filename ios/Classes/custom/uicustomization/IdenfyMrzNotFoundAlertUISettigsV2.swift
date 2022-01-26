//
//  IdenfyMrzNotFoundAlertUISettigsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-04-26.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit

@objc open class IdenfyMrzNotFoundAlertUISettigsV2: NSObject {
    // MRZ Not Found Alert Colors
    public static var idenfyMrzNotFoundAlertViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyMrzNotFoundAlertCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyMrzNotFoundAlertCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyMrzNotFoundAlertContinueButtonTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyMrzNotFoundAlertRetakePhotoButtonTextColor = IdenfyCommonColors.idenfyMainColorV2

    // MRZ Not Found Alert Fonts
    public static var idenfyMrzNotFoundAlertCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyMrzNotFoundAlertCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 14)
}
