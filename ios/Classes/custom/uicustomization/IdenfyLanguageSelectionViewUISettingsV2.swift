//
//  IdenfyLanguageSelectionViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-03-24.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyLanguageSelectionViewUISettingsV2: NSObject {
    // Idenfy Language Selection View Colors

    public static var idenfyLanguageSelectionViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyLanguageSelectionViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyLanguageSelectionViewLanguageTableViewBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyLanguageSelectionViewLanguageTableViewBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyLanguageSelectionViewLanguageTableViewCellBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyLanguageSelectionViewLanguageTableViewCellBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyLanguageSelectionViewLanguageTableViewCellTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyLanguageSelectionViewLanguageTableViewCellHighlightedTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyLanguageSelectionViewLanguageTableViewCellHighlightedBackgroundColor = IdenfyCommonColors.idenfyMainColorV2

    // Idenfy Language Selection View Fonts

    public static var idenfyLanguageSelectionViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyLanguageSelectionViewLanguageTableViewCellFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyLanguageSelectionViewLanguageTableViewHighlightedCellFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 14)

    // Idenfy Language Selection View Style

    public static var idenfyLanguageSelectionViewLanguageTableViewBorderWidth = CGFloat(2)
    public static var idenfyLanguageSelectionViewLanguageTableViewCornerRadius = CGFloat(3)
    public static var idenfyLanguageSelectionViewLanguageTableViewCellBorderWidth = CGFloat(2)
    public static var idenfyLanguageSelectionViewLanguageTableViewCellHeight = CGFloat(50)
}
