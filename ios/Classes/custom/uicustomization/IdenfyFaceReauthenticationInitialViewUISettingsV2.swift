//
//  FaceReauthenticationInitialViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-10-29.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyFaceReauthenticationInitialViewUISettingsV2: NSObject {
    // FaceReauthenticationInitialView Colors

    public static var idenfyFaceReauthenticationInitialViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyFaceReauthenticationInitialViewCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyFaceReauthenticationInitialViewCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyFaceReauthenticationInitialViewLivenessAttemptCountColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyFaceReauthenticationInitialViewContinueButtonTextColor = IdenfyCommonColors.idenfyWhite

    // FaceReauthenticationInitialView Fonts

    public static var idenfyFaceReauthenticationInitialViewCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyFaceReauthenticationInitialViewCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 15)
    public static var idenfyFaceReauthenticationInitialViewLivenessAttemptCountFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 15)
}
