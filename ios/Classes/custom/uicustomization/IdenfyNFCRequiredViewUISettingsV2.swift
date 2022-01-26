//
//  IdenfyNFCRequiredViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-04-06.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyNFCRequiredViewUISettingsV2: NSObject {
    // NFCRequiredViewV2 Colors

    public static var idenfyNFCRequiredViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyNFCRequiredCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyNFCRequiredCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyNFCRequiredContinueButtonTextColor = IdenfyCommonColors.idenfyWhite

    // NFCRequiredViewV2 Fonts

    public static var idenfyNFCRequiredCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyNFCRequiredCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 15)
}
