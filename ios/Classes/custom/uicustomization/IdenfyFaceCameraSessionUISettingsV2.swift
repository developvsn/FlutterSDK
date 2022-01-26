//
//  IdenfyFaceCameraSessionUiSettingsV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-02-12.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
@objc open class IdenfyFaceCameraSessionUISettingsV2: NSObject {
    // Idenfy Face Camera Preview Session Colors

    public static var idenfyFaceCameraPreviewSessionBackgroundColor = IdenfyCommonColors.idenfyBlack
    public static var idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor = IdenfyCommonColors.idenfyTakePhotoButtonIconUnFocused
    public static var idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor = IdenfyCommonColors.idenfyMainColorV2
    public static var idenfyFaceCameraPreviewSessionFaceOvalColor = IdenfyCommonColors.idenfyWhite
    public static var idenfyDocumentCameraPreviewSessionUploadPhotoButtonTintColor = IdenfyCommonColors.idenfyWhite.withAlphaComponent(0.5)
}
