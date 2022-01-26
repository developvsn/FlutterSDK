//
//  NFCReadingTimeOutViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-04-06.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class NFCReadingTimeOutViewV2: UIView, NFCReadingTimeOutViewableV2 {
    open weak var delegate: NFCReadingTimeOutViewButtonActionsDelegate?

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

    public var idenfyUILabelNFCReadingTimeOutCommonInformationTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyNFCReadingTimeOutViewUISettingsV2.idenfyNFCReadingTimeOutCommonInformationTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyNFCReadingTimeOutViewUISettingsV2.idenfyNFCReadingTimeOutCommonInformationTitleTextColor
        return label
    }()

    public var idenfyUILabelNFCReadingTimeOutCommonInformationDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyNFCReadingTimeOutViewUISettingsV2.idenfyNFCRReadingTimeOutCommonInformationDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyNFCReadingTimeOutViewUISettingsV2.idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor
        return label
    }()

    public var idenfyUIImageViewNFCRequiredCommonInformationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_manual_reviewing_status_failed_v2)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var idenfyUIButtonNFCReadingTimeOutContinue: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyNFCReadingTimeOutViewUISettingsV2.idenfyNFCReadingTimeOutContinueButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    @objc open func setupConstraints() {
        backgroundColor = IdenfyNFCReadingTimeOutViewUISettingsV2.idenfyNFCReadingTimeOutViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupCenterImageView()
        setupContinueButton()
        setupButtonActions()
    }

    private func setupButtonActions() {
        idenfyUIButtonNFCReadingTimeOutContinue.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
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
        addSubview(idenfyUILabelNFCReadingTimeOutCommonInformationTitle)
        idenfyUILabelNFCReadingTimeOutCommonInformationTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        idenfyUILabelNFCReadingTimeOutCommonInformationTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        idenfyUILabelNFCReadingTimeOutCommonInformationTitle.topAnchor.constraint(equalTo: idenfyToolbarV2Common.bottomAnchor, constant: 24).isActive = true

        addSubview(idenfyUILabelNFCReadingTimeOutCommonInformationDescription)
        idenfyUILabelNFCReadingTimeOutCommonInformationDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        idenfyUILabelNFCReadingTimeOutCommonInformationDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUILabelNFCReadingTimeOutCommonInformationDescription.topAnchor.constraint(equalTo: idenfyUILabelNFCReadingTimeOutCommonInformationTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupCenterImageView() {
        addSubview(idenfyUIImageViewNFCRequiredCommonInformationIcon)
        idenfyUIImageViewNFCRequiredCommonInformationIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUIImageViewNFCRequiredCommonInformationIcon.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIImageViewNFCRequiredCommonInformationIcon.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIImageViewNFCRequiredCommonInformationIcon.topAnchor.constraint(equalTo: idenfyUILabelNFCReadingTimeOutCommonInformationDescription.bottomAnchor, constant: 24).isActive = true
    }

    open func setupContinueButton() {
        addSubview(idenfyUIButtonNFCReadingTimeOutContinue)
        idenfyUIButtonNFCReadingTimeOutContinue.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIButtonNFCReadingTimeOutContinue.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIButtonNFCReadingTimeOutContinue.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        idenfyUIButtonNFCReadingTimeOutContinue.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
}
