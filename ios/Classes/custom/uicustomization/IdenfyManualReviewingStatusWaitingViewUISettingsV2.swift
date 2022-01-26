//
//  IdenfyManualReviewingViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-07-02.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyManualReviewingStatusWaitingViewUISettingsV2: NSObject {
    // ManualReviewingStatusWaitingViewV2 Colors

    public static var idenfyManualReviewingStatusWaitingViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.5)
    public static var idenfyManualReviewingStatusWaitingTimerTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyManualReviewingStatusWaitingStopWaitingButtonTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyManualReviewingStatusWaitingStepTitleColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyManualReviewingStatusWaitingStepViewHolderBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyManualReviewingStatusWaitingStepViewHolderShadowColor = IdenfyCommonColors.idenfyBlack
    public static var idenfyManualReviewingStatusWaitingStepViewHolderShadowOpacity: Float = 0.5
    public static var idenfyManualReviewingStatusWaitingStepViewHolderShadowRadius: CGFloat = 1

    // ManualReviewingStatusWaitingViewV2 Fonts

    public static var idenfyManualReviewingStatusWaitingCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyManualReviewingStatusWaitingCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyManualReviewingStatusWaitingTimerFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 32)
    public static var idenfyManualReviewingStatusWaitingStepFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 16)
}
