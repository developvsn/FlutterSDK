//
//  FaceCameraViewV2.swift
//  iDenfySDK
//
//  Created by Viktor Vostrikov on 2020-01-10.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc public class FaceCameraViewV2: UIView, FaceCameraViewableV2 {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
    }

    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    public required convenience init?(coder _: NSCoder) {
        self.init(frame: CGRect.zero)
    }

    public var cameraSessionsButtons: CameraSessionsButtonsViewableV2 = {
        let view = CameraSessionsButtonsViewV2(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isOpaque = true
        return view
    }()

    public var idenfyUIViewFaceOval: IdenfyFaceOvalV2 = {
        let view = IdenfyFaceOvalV2(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isOpaque = true
        view.backgroundColor = UIColor.clear
        return view
    }()

    open func setupConstraints() {
        setupCameraSessionsButtons()
        setupUIViewFaceOval()
    }

    func setupCameraSessionsButtons() {
        addSubview(cameraSessionsButtons)
        cameraSessionsButtons.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cameraSessionsButtons.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cameraSessionsButtons.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cameraSessionsButtons.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func setupUIViewFaceOval() {
        addSubview(idenfyUIViewFaceOval)
        idenfyUIViewFaceOval.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUIViewFaceOval.bottomAnchor.constraint(equalTo: cameraSessionsButtons.idenfyUIViewContainerOfButtons.topAnchor, constant: -16).isActive = true
        // TODO: move to seperate extension
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let statusBarSizeMin = Swift.min(statusBarSize.width, statusBarSize.height)
        var top = statusBarSizeMin + ConstsIdenfyUI.IDENFY_TOP_DRAWER_INSTRUCTIONS_HEIGHT
        // adding because of iOS version
        if #available(iOS 11.0, *) {
        } else {
            top += 20
        }
        // adding more for better margin
        top += 16
        idenfyUIViewFaceOval.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
        idenfyUIViewFaceOval.widthAnchor.constraint(equalTo: idenfyUIViewFaceOval.heightAnchor, multiplier: 0.7).isActive = true
    }
}
