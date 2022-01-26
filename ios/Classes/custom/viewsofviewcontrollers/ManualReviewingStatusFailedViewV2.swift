//
//  ManualReviewingIdentificationFailedResultsViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-07-16.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class ManualReviewingStatusFailedViewV2: UIView, ManualReviewingStatusFailedViewableV2 {
    public weak var delegate: ManualReviewingStatusFailedViewButtonActionsDelegate?

    public var idenfyToolbarV2Common: IdenfyToolbarV2Default = {
        let toolbar = IdenfyToolbarV2Default(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var idenfyUILabelManualReviewingStatusFailedCommonInformationTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyManualReviewingStatusFailedViewUISettingsV2.idenfyManualReviewingStatusFailedCommonInformationTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyManualReviewingStatusFailedViewUISettingsV2.idenfyManualReviewingStatusFailedCommonInformationTitleTextColor
        return label
    }()

    public var idenfyUILabelManualReviewingStatusFailedCommonInformationDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyManualReviewingStatusFailedViewUISettingsV2.idenfyManualReviewingStatusFailedCommonInformationDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyManualReviewingStatusFailedViewUISettingsV2.idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor
        return label
    }()

    public var idenfyUIImageViewManualReviewingStatusFailedCommonInformationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_manual_reviewing_status_failed_v2)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var idenfyUIButtonManualReviewingStatusFailedContinue: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyManualReviewingStatusFailedViewUISettingsV2.idenfyManualReviewingStatusFailedContinueButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    @objc open func setupConstraints() {
        backgroundColor = IdenfyManualReviewingStatusFailedViewUISettingsV2.idenfyManualReviewingStatusFailedViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupCenterImageView()
        setupContinueButton()
        setupButtonActions()
    }

    private func setupButtonActions() {
        idenfyUIButtonManualReviewingStatusFailedContinue.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
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
        addSubview(idenfyUILabelManualReviewingStatusFailedCommonInformationTitle)
        idenfyUILabelManualReviewingStatusFailedCommonInformationTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        idenfyUILabelManualReviewingStatusFailedCommonInformationTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        idenfyUILabelManualReviewingStatusFailedCommonInformationTitle.topAnchor.constraint(equalTo: idenfyToolbarV2Common.bottomAnchor, constant: 24).isActive = true

        addSubview(idenfyUILabelManualReviewingStatusFailedCommonInformationDescription)
        idenfyUILabelManualReviewingStatusFailedCommonInformationDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        idenfyUILabelManualReviewingStatusFailedCommonInformationDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUILabelManualReviewingStatusFailedCommonInformationDescription.topAnchor.constraint(equalTo: idenfyUILabelManualReviewingStatusFailedCommonInformationTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupCenterImageView() {
        addSubview(idenfyUIImageViewManualReviewingStatusFailedCommonInformationIcon)

        idenfyUIImageViewManualReviewingStatusFailedCommonInformationIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyUIImageViewManualReviewingStatusFailedCommonInformationIcon.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIImageViewManualReviewingStatusFailedCommonInformationIcon.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIImageViewManualReviewingStatusFailedCommonInformationIcon.topAnchor.constraint(equalTo: idenfyUILabelManualReviewingStatusFailedCommonInformationDescription.bottomAnchor, constant: 24).isActive = true
    }

    open func setupContinueButton() {
        addSubview(idenfyUIButtonManualReviewingStatusFailedContinue)
        idenfyUIButtonManualReviewingStatusFailedContinue.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIButtonManualReviewingStatusFailedContinue.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIButtonManualReviewingStatusFailedContinue.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        idenfyUIButtonManualReviewingStatusFailedContinue.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
}
