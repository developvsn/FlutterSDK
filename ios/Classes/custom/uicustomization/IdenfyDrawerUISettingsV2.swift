//
//  IdenfyDrawerUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-02-12.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyDrawerUISettingsV2: NSObject {
    // Idenfy Drawer Colors

    public static var idenfyDrawerExpandButtonTintColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDrawerTitleTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDrawerDescriptionTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDrawerCurrentInstructionTitleTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDrawerCurrentInstructionDescriptionTextColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDrawerInstructionControlsTintColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDrawerCurrentInstructionIndicatorColor = "#FFC700".hexColor
    public static var idenfyDrawerNextInstructionButtonColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDrawerPreviousInstructionButtonColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDrawerGradientBackgroundTopColor = UIColor.black.withAlphaComponent(0)
    public static var idenfyDrawerGradientBackgroundBottomColor = UIColor.black.withAlphaComponent(0.8)

    // Idenfy Drawer Fonts

    public static var idenfyDrawerTitleFont = UIFont.systemFont(ofSize: 22, weight: .semibold)
    public static var idenfyDrawerDescriptionFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    public static var idenfyDrawerCurrentInstructionTitleFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    public static var idenfyDrawerCurrentInstructionDescriptionFont = UIFont.systemFont(ofSize: 13, weight: .regular)
}
