//
//  NFCRequiredViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-04-06.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class NFCRequiredViewV2: UIView, NFCRequiredViewableV2 {
    open weak var delegate: NFCRequiredViewButtonActionsDelegate?

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

    public var idenfyUILabelNFCRequiredCommonInformationTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyNFCRequiredViewUISettingsV2.idenfyNFCRequiredCommonInformationTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyNFCRequiredViewUISettingsV2.idenfyNFCRequiredCommonInformationTitleTextColor
        return label
    }()

    public var idenfyUILabelNFCRequiredCommonInformationDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyNFCRequiredViewUISettingsV2.idenfyNFCRequiredCommonInformationDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyNFCRequiredViewUISettingsV2.idenfyNFCRequiredCommonInformationDescriptionTextColor
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

    public var idenfyUIButtonNFCRequiredContinue: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyNFCRequiredViewUISettingsV2.idenfyNFCRequiredContinueButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    @objc open func setupConstraints() {
        backgroundColor = IdenfyNFCRequiredViewUISettingsV2.idenfyNFCRequiredViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupCenterImageView()
        setupContinueButton()
        setupButtonActions()
    }

    private func setupButtonActions() {
        idenfyUIButtonNFCRequiredContinue.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
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
        addSubview(idenfyUILabelNFCRequiredCommonInformationTitle)
        idenfyUILabelNFCRequiredCommonInformationTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        idenfyUILabelNFCRequiredCommonInformationTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        idenfyUILabelNFCRequiredCommonInformationTitle.topAnchor.constraint(equalTo: idenfyToolbarV2Common.bottomAnchor, constant: 24).isActive = true

        addSubview(idenfyUILabelNFCRequiredCommonInformationDescription)
        idenfyUILabelNFCRequiredCommonInformationDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        idenfyUILabelNFCRequiredCommonInformationDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUILabelNFCRequiredCommonInformationDescription.topAnchor.constraint(equalTo: idenfyUILabelNFCRequiredCommonInformationTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupCenterImageView() {
        addSubview(idenfyUIImageViewNFCRequiredCommonInformationIcon)
        idenfyUIImageViewNFCRequiredCommonInformationIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUIImageViewNFCRequiredCommonInformationIcon.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIImageViewNFCRequiredCommonInformationIcon.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIImageViewNFCRequiredCommonInformationIcon.topAnchor.constraint(equalTo: idenfyUILabelNFCRequiredCommonInformationDescription.bottomAnchor, constant: 24).isActive = true
    }

    open func setupContinueButton() {
        addSubview(idenfyUIButtonNFCRequiredContinue)
        idenfyUIButtonNFCRequiredContinue.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIButtonNFCRequiredContinue.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIButtonNFCRequiredContinue.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        idenfyUIButtonNFCRequiredContinue.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
}
