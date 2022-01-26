//
//  IdenfyFailedAfterManualReviewingViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-07-21.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyManualReviewingStatusFailedViewUISettingsV2: NSObject {
    // ManualReviewingStatusFailedViewV2 Colors

    public static var idenfyManualReviewingStatusFailedViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyManualReviewingStatusFailedCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.5)
    public static var idenfyManualReviewingStatusFailedContinueButtonTextColor = IdenfyCommonColors.idenfyWhite

    // ManualReviewingStatusFailedViewV2 Fonts

    public static var idenfyManualReviewingStatusFailedCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyManualReviewingStatusFailedCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
}
