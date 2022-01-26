//
//  ProviderSelectionViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-05-05.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyProviderSelectionViewUISettingsV2: NSObject {
    // Idenfy Provider Selection View Colors

    public static var idenfyProviderSelectionViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyProviderSelectionViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyProviderSelectionViewDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyProviderSelectionViewProviderSearchBarBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyProviderSelectionViewProviderSearchBarTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyProviderSelectionViewProviderSearchBarHintTextColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.5)
    public static var idenfyProviderSelectionViewProviderTableViewBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyProviderSelectionViewProviderTableViewBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyProviderSelectionViewProviderTableViewCellBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyProviderSelectionViewProviderTableViewCellBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyProviderSelectionViewProviderTableViewCellTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyProviderSelectionViewProviderTableViewCellHighlightedTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyProviderSelectionViewProviderTableViewCellHighlightedBackgroundColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyProviderSelectionViewProviderSearchBarBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)

    // Idenfy Provider Selection View Fonts

    public static var idenfyProviderSelectionViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyProviderSelectionViewDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyProviderSelectionViewSearchBarHintFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyProviderSelectionViewSearchBarFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyProviderSelectionViewProviderTableViewCellFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyProviderSelectionViewProviderTableViewHighlightedCellFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 14)

    // Idenfy Provider Selection View Style

    public static var idenfyProviderSelectionViewProviderSearchBarBorderWidth = CGFloat(2)
    public static var idenfyProviderSelectionViewProviderSearchBarCorderRadius = CGFloat(3)
    public static var idenfyProviderSelectionViewProviderTableViewBorderWidth = CGFloat(2)
    public static var idenfyProviderSelectionViewProviderTableViewCornerRadius = CGFloat(3)
    public static var idenfyProviderSelectionViewProviderTableViewCellBorderWidth = CGFloat(2)
    public static var idenfyProviderSelectionViewProviderTableViewCellHeight = CGFloat(50)
}
