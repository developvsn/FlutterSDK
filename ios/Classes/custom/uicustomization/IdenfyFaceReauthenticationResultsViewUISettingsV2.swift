//
//  IdenfyFaceReauthenticationResultsViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-10-29.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyFaceReauthenticationResultsViewUISettingsV2: NSObject {
    // FaceReauthenticationResultsView Colors

    public static var idenfyFaceReauthenticationResultsViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyFaceReauthenticationResultsViewCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyFaceReauthenticationResultsViewCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyFaceReauthenticationResultsViewContinueButtonTextColor = IdenfyCommonColors.idenfyWhite

    // FaceReauthenticationResultsView Fonts

    public static var idenfyFaceReauthenticationResultsViewCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyFaceReauthenticationResultsViewCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 15)
}
