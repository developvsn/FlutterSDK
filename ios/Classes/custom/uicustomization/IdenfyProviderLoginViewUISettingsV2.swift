//
//  IdenfyProviderLoginViewUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-05-05.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyLoginSelectionViewUISettingsV2: NSObject {
    // Idenfy Provider Login View Colors

    public static var idenfyProviderLoginViewBackgroundColor = IdenfyCommonColors.idenfyBackgroundColorV2
    public static var idenfyProviderLoginViewTitleTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyProviderLoginViewDescriptionTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyProviderLoginViewUsernameHintTextColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyProviderLoginViewPasswordHintTextColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyProviderLoginViewUsernameInputViewTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyProviderLoginViewPasswordInputViewTextColor = IdenfyCommonColors.idenfySecondColorV2
    public static var idenfyProviderLoginViewUsernameInputBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyProviderLoginViewPasswordInputBorderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.06)
    public static var idenfyProviderLoginViewUsernameInputFocusedBorderColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyProviderLoginViewPasswordInputFocusedBorderColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyProviderLoginViewUsernameInputViewBackgroundColor = UIColor.white
    public static var idenfyProviderLoginViewPasswordInputViewBackgroundColor = UIColor.white
    public static var idenfyProviderLoginViewContinueButtonTextColor = IdenfyCommonColors.idenfyWhite

    // Idenfy Provider Login View Fonts

    public static var idenfyProviderLoginViewTitleFont = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 22)
    public static var idenfyProviderLoginViewDescriptionFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 13)
    public static var idenfyProviderLoginViewUsernameHintFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 10)
    public static var idenfyProviderLoginViewPasswordHintFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 10)
    public static var idenfyProviderLoginViewUsernameInputViewFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 16)
    public static var idenfyProviderLoginViewPasswordInputViewFont = UIFont(name: ConstsIdenfyFonts.idenfyFontRegularV2, size: 16)

    // Idenfy Provider Login View Style

    public static var idenfyProviderLoginViewUsernameInputViewCorderRadius = CGFloat(3)
    public static var idenfyProviderLoginViewPasswordInputViewCorderRadius = CGFloat(3)
    public static var idenfyProviderLoginViewUsernameInputBorderWidth = CGFloat(1)
    public static var idenfyProviderLoginViewPasswordInputBorderWidth = CGFloat(1)
}
