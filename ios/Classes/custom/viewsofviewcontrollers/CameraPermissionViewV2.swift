//
//  CameraPermissionViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-08-19.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class CameraPermissionViewV2: UIView, CameraPermissionViewableV2 {
    open weak var delegate: CameraPermissionViewButtonActionsDelegate?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var toolbar: IdenfyToolbarV2Default = {
        let toolbar = IdenfyToolbarV2Default(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.backButton.isHidden = true
        return toolbar
    }()

    public var cameraPermissionTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyCameraPermissionViewUISettingsV2.idenfyCameraPermissionViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyCameraPermissionViewUISettingsV2.idenfyCameraPermissionViewTitleTextColor
        return label
    }()

    public var cameraPermissionDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyCameraPermissionViewUISettingsV2.idenfyCameraPermissionViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyCameraPermissionViewUISettingsV2.idenfyCameraPermissionViewDescriptionTextColor
        return label
    }()

    public var cameraPermissionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_camera_permissions_v2)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var cameraPermissionGuidanceDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyCameraPermissionViewUISettingsV2.idenfyCameraPermissionViewGuidanceDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyCameraPermissionViewUISettingsV2.idenfyCameraPermissionViewGuidancePermissionTextColor
        return label
    }()

    public var cameraPermissionGoToSettingsButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyCameraPermissionViewUISettingsV2.idenfyCameraPermissionViewGoToSettingsButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyCameraPermissionViewUISettingsV2.idenfyCameraPermissionViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupGoToSettingsButton()
        setupCenterImageView()
        setupCenterTitle()
        setupButtonActions()
    }

    private func setupButtonActions() {
        cameraPermissionGoToSettingsButton.addTarget(self, action: #selector(goToSettingsButtonPressed), for: .touchUpInside)
    }

    @objc func goToSettingsButtonPressed() {
        delegate?.goToSettingsButtonPressed()
    }

    open func setupToolbar() {
        addSubview(toolbar)
        toolbar.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        toolbar.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
        if #available(iOS 11.0, *) {
            toolbar.topAnchor.constraint(equalTo: self.safeTopAnchor).isActive = true
        } else {
            toolbar.topAnchor.constraint(equalTo: safeTopAnchor, constant: 20).isActive = true
        }
        toolbar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    open func setupTopTitle() {
        addSubview(cameraPermissionTitle)
        cameraPermissionTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        cameraPermissionTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        cameraPermissionTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true

        addSubview(cameraPermissionDescription)
        cameraPermissionDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        cameraPermissionDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cameraPermissionDescription.topAnchor.constraint(equalTo: cameraPermissionTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupCenterImageView() {
        addSubview(cameraPermissionImageView)
        cameraPermissionImageView.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        cameraPermissionImageView.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
        cameraPermissionImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        let top = cameraPermissionImageView.topAnchor.constraint(equalTo: cameraPermissionDescription.bottomAnchor, constant: 16)
        top.priority = UILayoutPriority.fittingSizeLevel
        top.isActive = true
        let bottom = cameraPermissionImageView.bottomAnchor.constraint(equalTo: cameraPermissionGoToSettingsButton.topAnchor, constant: -16)
        bottom.priority = UILayoutPriority.fittingSizeLevel
        bottom.isActive = true
    }

    open func setupCenterTitle() {
        addSubview(cameraPermissionGuidanceDescription)
        cameraPermissionGuidanceDescription.topAnchor.constraint(equalTo: cameraPermissionImageView.bottomAnchor, constant: 24).isActive = true
        cameraPermissionGuidanceDescription.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        cameraPermissionGuidanceDescription.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
    }

    open func setupGoToSettingsButton() {
        addSubview(cameraPermissionGoToSettingsButton)
        cameraPermissionGoToSettingsButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        cameraPermissionGoToSettingsButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        cameraPermissionGoToSettingsButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        cameraPermissionGoToSettingsButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
}
