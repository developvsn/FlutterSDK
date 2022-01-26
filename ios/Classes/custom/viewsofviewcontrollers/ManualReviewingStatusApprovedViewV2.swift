//
//  ManualReviewingIdentificationApprovedResultsViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-07-16.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class ManualReviewingStatusApprovedViewV2: UIView, ManualReviewingStatusApprovedViewableV2 {
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
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    public var idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyManualReviewingStatusApprovedViewUISettingsV2.idenfyManualReviewingStatusApprovedCommonInformationTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyManualReviewingStatusApprovedViewUISettingsV2.idenfyManualReviewingStatusApprovedCommonInformationTitleTextColor
        return label
    }()

    public var idenfyUILabelManualReviewingStatusApprovedCommonInformationDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyManualReviewingStatusApprovedViewUISettingsV2.idenfyManualReviewingStatusApprovedCommonInformationDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyManualReviewingStatusApprovedViewUISettingsV2.idenfyManualReviewingStatusApprovedCommonInformationDescriptionTextColor
        return label
    }()

    public var idenfyUIImageViewManualReviewingStatusApprovedCommonInformationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_manual_reviewing_status_approved_v2)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var idenfyUIButtonManualReviewingStatusApprovedContinue: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyManualReviewingStatusApprovedViewUISettingsV2.idenfyManualReviewingStatusApprovedContinueButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    @objc open func setupConstraints() {
        backgroundColor = IdenfyManualReviewingStatusApprovedViewUISettingsV2.idenfyManualReviewingStatusApprovedViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupCenterImageView()
        setupContinueButton()
        setupButtonActions()
    }

    private func setupButtonActions() {
        idenfyUIButtonManualReviewingStatusApprovedContinue.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
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
        addSubview(idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle)
        idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.topAnchor.constraint(equalTo: idenfyToolbarV2Common.bottomAnchor, constant: 24).isActive = true

        addSubview(idenfyUILabelManualReviewingStatusApprovedCommonInformationDescription)
        idenfyUILabelManualReviewingStatusApprovedCommonInformationDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        idenfyUILabelManualReviewingStatusApprovedCommonInformationDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUILabelManualReviewingStatusApprovedCommonInformationDescription.topAnchor.constraint(equalTo: idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupCenterImageView() {
        addSubview(idenfyUIImageViewManualReviewingStatusApprovedCommonInformationIcon)
        idenfyUIImageViewManualReviewingStatusApprovedCommonInformationIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUIImageViewManualReviewingStatusApprovedCommonInformationIcon.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIImageViewManualReviewingStatusApprovedCommonInformationIcon.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIImageViewManualReviewingStatusApprovedCommonInformationIcon.topAnchor.constraint(equalTo: idenfyUILabelManualReviewingStatusApprovedCommonInformationDescription.bottomAnchor, constant: 24).isActive = true
    }

    open func setupContinueButton() {
        addSubview(idenfyUIButtonManualReviewingStatusApprovedContinue)
        idenfyUIButtonManualReviewingStatusApprovedContinue.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIButtonManualReviewingStatusApprovedContinue.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIButtonManualReviewingStatusApprovedContinue.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        idenfyUIButtonManualReviewingStatusApprovedContinue.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
}
