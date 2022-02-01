//
//  IdenfyCountrySelectionViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-02-12.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyCountrySelectionViewUISettingsV3: NSObject {
    // Idenfy Country Selection View Colors

    public static var idenfyCountrySelectionViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyCountrySelectionViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyCountrySelectionViewDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyCountrySelectionViewCountrySearchBarBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyCountrySelectionViewCountrySearchBarTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyCountrySelectionViewCountrySearchBarHintTextColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.5)
    public static var idenfyCountrySelectionViewCountryTableViewBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyCountrySelectionViewCountryTableViewBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyCountrySelectionViewCountryTableViewCellBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyCountrySelectionViewCountryTableViewCellBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyCountrySelectionViewCountryTableViewCellTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyCountrySelectionViewCountryTableViewCellHighlightedTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyCountrySelectionViewCountryTableViewCellHighlightedBackgroundColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyCountrySelectionViewCountrySearchBarBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)

    // Idenfy Country Selection View Fonts

    public static var idenfyCountrySelectionViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyCountrySelectionViewDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyCountrySelectionViewSearchBarHintFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyCountrySelectionViewSearchBarFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyCountrySelectionViewCountryTableViewCellFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyCountrySelectionViewCountryTableViewHighlightedCellFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 14)

    // Idenfy Country Selection View Style

    public static var idenfyCountrySelectionViewCountrySearchBarBorderWidth = CGFloat(2)
    public static var idenfyCountrySelectionViewCountrySearchBarCorderRadius = CGFloat(3)
    public static var idenfyCountrySelectionViewCountryTableViewBorderWidth = CGFloat(2)
    public static var idenfyCountrySelectionViewCountryTableViewCornerRadius = CGFloat(3)
    public static var idenfyCountrySelectionViewCountryFlagBorderWidth = CGFloat(1)
    public static var idenfyCountrySelectionViewCountryTableViewCellBorderWidth = CGFloat(2)
    public static var idenfyCountrySelectionViewCountryTableViewCellHeight = CGFloat(50)
}
