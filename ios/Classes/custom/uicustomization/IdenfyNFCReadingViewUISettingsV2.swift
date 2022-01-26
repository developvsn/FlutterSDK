//
//  IdenfyNFCReadingViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-04-06.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyNFCReadingViewUISettingsV2: NSObject {
    // NFCReadingViewV2 Colors

    public static var idenfyNFCReadingViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyNFCReadingCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyNFCReadingCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyNFCReadingContinueButtonTextColor = IdenfyCommonColors.idenfyWhite

    // NFCReadingViewV2 Fonts

    public static var idenfyNFCReadingCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyNFCReadingCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 18)
}
