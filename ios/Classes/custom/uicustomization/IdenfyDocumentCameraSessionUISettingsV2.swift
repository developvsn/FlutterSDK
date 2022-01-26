//
//  IdenfyDocumentCameraSessionUISettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-02-12.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyDocumentCameraSessionUISettingsV2: NSObject {
    // Idenfy Document Camera Preview Session Colors

    public static var idenfyDocumentCameraPreviewSessionBackgroundColor = IdenfyCommonColors.idenfyBlack
    public static var idenfyDocumentCameraPreviewSessionBottomActionButtonsViewBackgroundColor = IdenfyCommonColors.idenfyDrawerBackgroundColor
    public static var idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor = IdenfyCommonColors.idenfyTakePhotoButtonIconUnFocused
    public static var idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor = "#FFC700".hexColor
    public static var idenfyDocumentCameraPreviewSessionUploadPhotoButtonTintColor = IdenfyCommonColors.idenfyWhite.withAlphaComponent(0.4)
    public static var idenfyDocumentCameraPreviewSessionToggleFlashButtonTintColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentCameraPreviewSessionSwitchLensButtonTintColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentCameraPreviewSessioninstructionDialogButtonTintColor = IdenfyCommonColors.idenfyWhite
}
