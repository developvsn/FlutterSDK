//
//  IdenfyDocumentSelectionViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-02-12.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyDocumentSelectionViewUISettingsV2: NSObject {
    // Idenfy Document Selection View Colors

    public static var idenfyDocumentSelectionViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyDocumentSelectionViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocumentSelectionViewDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocumentSelectionViewDocumentTableViewBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyDocumentSelectionViewDocumentTableViewBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentSelectionViewDocumentTableViewCellBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentSelectionViewDocumentTableViewCellBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyDocumentSelectionViewDocumentTableViewCellTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocumentSelectionViewDocumentTableViewCellHighlightedTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentSelectionViewDocumentTableViewCellHighlightedBackgroundColor = IdenfyCommonColors.idenfyMainColorV2

    // Idenfy Document Selection View Fonts

    public static var idenfyDocumentSelectionViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyDocumentSelectionViewDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyDocumentSelectionViewDocumentTypeFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyDocumentSelectionViewDocumentTypeHighlightedFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 13)

    // Idenfy Document Selection View Style

    public static var idenfyDocumentSelectionViewDocumentTableViewBorderWidth = CGFloat(2)
    public static var idenfyDocumentSelectionViewDocumentTableViewCornerRadius = CGFloat(3)
    public static var idenfyDocumentSelectionViewDocumentTableViewCellBorderWidth = CGFloat(2)
    public static var idenfyDocumentSelectionViewDocumentTableViewCellHeight = CGFloat(56)
}
