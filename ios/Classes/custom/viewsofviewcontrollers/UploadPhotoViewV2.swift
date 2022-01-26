//
//  UploadPhotoViewV2.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 2019-12-23.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class UploadPhotoViewV2: UIView, UploadPhotoViewableV2 {
    open weak var delegate: UploadPhotoButtonActionsDelegate?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var toolbar: IdenfyToolbarV2CameraSession = {
        let toolbar = IdenfyToolbarV2CameraSession(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    public var uploadTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewTitleTextColor
        return label
    }()

    public var uploadDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewDescriptionTextColor
        return label
    }()

    public var cropperView: CropPickerView = {
        let cropperView = CropPickerView()
        cropperView.translatesAutoresizingMaskIntoConstraints = false
        cropperView.layer.cornerRadius = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewCroppingViewCornerRadius
        // Uncomment for border to appear
        // cropperView.layer.masksToBounds = true
        // cropperView.backgroundColor = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewCroppingBackgroundColor
        // cropperView.layer.borderWidth = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewCroppingViewBorderWidth
        // cropperView.layer.borderColor = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewCroppingBorderColor.cgColor
        return cropperView
    }()

    public var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    public var chooseAnotherPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.backgroundColor = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewChooseAnotherPhotoButtonBackgroundColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.layer.borderWidth = IdenfyButtonsUISettingsV2.idenfyChooseAnotherPhotoButtonCornerRadius
        button.layer.borderColor = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewChooseAnotherPhotoButtonBorderColor.cgColor
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupButtons()
        setupCropperView()
        setupButtonActions()
    }

    private func setupButtonActions() {
        continueButton.addTarget(self, action: #selector(continueButtonPressedAction), for: .touchUpInside)
        chooseAnotherPhotoButton.addTarget(self, action: #selector(chooseAnotherPhotoButtonPressed), for: .touchUpInside)
    }

    @objc func continueButtonPressedAction() {
        delegate?.continueButtonPressedAction()
    }

    @objc func chooseAnotherPhotoButtonPressed() {
        delegate?.chooseAnotherPhotoButtonPressedAction()
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
        addSubview(uploadTitle)
        uploadTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -8).isActive = true
        uploadTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 8).isActive = true
        uploadTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: -16).isActive = true

        addSubview(uploadDescription)
        uploadDescription.widthAnchor.constraint(equalTo: uploadTitle.widthAnchor, multiplier: 0.8).isActive = true
        uploadDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        uploadDescription.topAnchor.constraint(equalTo: uploadTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupButtons() {
        addSubview(chooseAnotherPhotoButton)
        chooseAnotherPhotoButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        chooseAnotherPhotoButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 24).isActive = true
        chooseAnotherPhotoButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -24).isActive = true
        chooseAnotherPhotoButton.heightAnchor.constraint(equalToConstant: 42).isActive = true

        addSubview(continueButton)
        continueButton.bottomAnchor.constraint(equalTo: chooseAnotherPhotoButton.topAnchor, constant: -16).isActive = true
        continueButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 24).isActive = true
        continueButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -24).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }

    open func setupCropperView() {
        addSubview(cropperView)
        cropperView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -24).isActive = true
        cropperView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        cropperView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        if #available(iOS 11.0, *) {
            cropperView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 152).isActive = true
        } else {
            cropperView.topAnchor.constraint(equalTo: safeTopAnchor, constant: 172).isActive = true
        }
    }
}
