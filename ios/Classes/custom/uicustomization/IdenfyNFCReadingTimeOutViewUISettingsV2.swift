//
//  IdenfyNFCReadingTimeOutViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-04-06.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyNFCReadingTimeOutViewUISettingsV2: NSObject {
    // NFCRReadingTimeOutViewV2 Colors

    public static var idenfyNFCReadingTimeOutViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyNFCReadingTimeOutCommonInformationTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyNFCReadingTimeOutContinueButtonTextColor = IdenfyCommonColors.idenfyWhite

    // NFCReadingTimeOutViewV2 Fonts

    public static var idenfyNFCReadingTimeOutCommonInformationTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyNFCRReadingTimeOutCommonInformationDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 15)
}
