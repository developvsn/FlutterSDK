//
//  IdenfyConfirmationViewUISettings.swift
//  idenfyviews
//
//  Created by Viktor Vostrikov on 2020-02-10.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyConfirmationViewUISettingsV2: NSObject {
    // Idenfy Confirmation View Colors

    public static var idenfyDocumentConfirmationViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyDocumentConfirmationViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocumentConfirmationViewDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocumentConfirmationViewDescriptionHighlightedTextColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyDocumentConfirmationViewBeginIdentificationButtonTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentConfirmationViewDocumentStepTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocumentConfirmationViewDocumentStepTitleHighlightedTextColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyDocumentConfirmationViewUploadDocumentPhotoTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocumentConfirmationViewDocumentStepCellNumberTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentConfirmationViewDocumentStepCellTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyDocumentConfirmationViewContentMaskForegroundColor = IdenfyCommonColors.idenfyBackgroundColorV2.withAlphaComponent(0.9)
    public static var idenfyDocumentConfirmationViewUploadIconTintColor: UIColor? = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyDocumentConfirmationViewDocumentStepCircleTintColor: UIColor? = IdenfyCommonColors.idenfyMainColorV2

    // Idenfy Confirmation View Fonts

    public static var idenfyDocumentConfirmationViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyDocumentConfirmationViewDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyDocumentConfirmationViewDescriptionHighlightedFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 13)
    public static var idenfyDocumentConfirmationViewDocumentStepTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 13)
    public static var idenfyDocumentConfirmationViewUploadTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyDocumentConfirmationViewDocumentStepNumberFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 11)
    public static var idenfyDocumentConfirmationViewDocumentStepFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)

    // Idenfy Confirmation View Style

    public static var idenfyDocumentConfirmationViewDocumentStepCellHeight = CGFloat(30)
}
