//
//  NFCReadingViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-03-29.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import Lottie
import UIKit

@objc open class NFCReadingViewV2: UIView, NFCReadingViewableV2 {
    open weak var delegate: ManualReviewingStatusApprovedViewButtonActionsDelegate?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var idenfyToolbarV2Common: IdenfyToolbarV2Default = {
        let toolbar = IdenfyToolbarV2Default(frame: .zero)
        toolbar.backButton.isHidden = true
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    public var idenfyUILabelNFCReadingCommonInformationTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyNFCReadingViewUISettingsV2.idenfyNFCReadingCommonInformationTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyNFCReadingViewUISettingsV2.idenfyNFCReadingCommonInformationTitleTextColor
        return label
    }()

    public var idenfyUILabelNFCReadingCommonInformationDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyNFCReadingViewUISettingsV2.idenfyNFCReadingCommonInformationDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyNFCReadingViewUISettingsV2.idenfyNFCReadingCommonInformationDescriptionTextColor
        return label
    }()

    public var idenfyUIImageViewNFCReadingCommonInformationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_manual_reviewing_status_approved_v2)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var idenfyNFCReadingLoadingSpinner: AnimationView = {
        let lottieView = AnimationView(frame: .zero)
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        if let path = IdenfyViewUtils.getResourcePath(name: ConstsIdenfyOtherResources.idenfy_custom_animation_nfc_screen_loading_indicator, type: ResourceType.json) {
            lottieView.animation = Animation.filepath(path)
        }
        lottieView.contentMode = .scaleAspectFit
        lottieView.play()
        lottieView.loopMode = .loop
        return lottieView
    }()

    public var idenfyUIButtonNFCReadingContinue: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyNFCReadingViewUISettingsV2.idenfyNFCReadingContinueButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    @objc open func setupConstraints() {
        backgroundColor = IdenfyNFCReadingViewUISettingsV2.idenfyNFCReadingViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupCenterImageView()
        setupLoadingSpiner()
        setupContinueButton()
        setupButtonActions()
    }

    private func setupButtonActions() {
        idenfyUIButtonNFCReadingContinue.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
    }

    @objc func continueButtonPressed() {
        delegate?.continueButtonPressedAction()
    }

    open func setupToolbar() {
        addSubview(idenfyToolbarV2Common)
        idenfyToolbarV2Common.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        idenfyToolbarV2Common.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
        if #available(iOS 11.0, *) {
            idenfyToolbarV2Common.topAnchor.constraint(equalTo: self.safeTopAnchor).isActive = true
        } else {
            idenfyToolbarV2Common.topAnchor.constraint(equalTo: safeTopAnchor, constant: 20).isActive = true
        }
        idenfyToolbarV2Common.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    open func setupTopTitle() {
        addSubview(idenfyUILabelNFCReadingCommonInformationTitle)
        idenfyUILabelNFCReadingCommonInformationTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        idenfyUILabelNFCReadingCommonInformationTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        idenfyUILabelNFCReadingCommonInformationTitle.topAnchor.constraint(equalTo: idenfyToolbarV2Common.bottomAnchor, constant: 24).isActive = true

        addSubview(idenfyUILabelNFCReadingCommonInformationDescription)
        idenfyUILabelNFCReadingCommonInformationDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        idenfyUILabelNFCReadingCommonInformationDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUILabelNFCReadingCommonInformationDescription.topAnchor.constraint(equalTo: idenfyUILabelNFCReadingCommonInformationTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupCenterImageView() {
        addSubview(idenfyUIImageViewNFCReadingCommonInformationIcon)
        idenfyUIImageViewNFCReadingCommonInformationIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUIImageViewNFCReadingCommonInformationIcon.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIImageViewNFCReadingCommonInformationIcon.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIImageViewNFCReadingCommonInformationIcon.topAnchor.constraint(equalTo: idenfyUILabelNFCReadingCommonInformationDescription.bottomAnchor, constant: 24).isActive = true
    }

    open func setupLoadingSpiner() {
        addSubview(idenfyNFCReadingLoadingSpinner)
        idenfyNFCReadingLoadingSpinner.widthAnchor.constraint(equalToConstant: 250).isActive = true
        idenfyNFCReadingLoadingSpinner.heightAnchor.constraint(equalToConstant: 250).isActive = true
        idenfyNFCReadingLoadingSpinner.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyNFCReadingLoadingSpinner.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyNFCReadingLoadingSpinner.topAnchor.constraint(equalTo: idenfyUILabelNFCReadingCommonInformationDescription.bottomAnchor).isActive = true
    }

    open func setupContinueButton() {
        addSubview(idenfyUIButtonNFCReadingContinue)
        idenfyUIButtonNFCReadingContinue.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIButtonNFCReadingContinue.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIButtonNFCReadingContinue.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        idenfyUIButtonNFCReadingContinue.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
}
