//
//  ManualReviewingViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-07-02.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import idenfyviews
import UIKit

@objc open class ManualReviewingStatusWaitingViewV2: UIView, ManualReviewingStatusWaitingViewableV2 {
    open weak var delegate: ManualReviewingStatusWaitingViewButtonActionsDelegate?

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
        toolbar.backButton.isHidden = true
        return toolbar
    }()

    public var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isUserInteractionEnabled = true
        scroll.bounces = false
        return scroll
    }()

    public var scrollViewContentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var idenfyViewHolderManualResultsWaitingViewStepCompleted: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepViewHolderBackgroundColor
        view.layer.shadowColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepViewHolderShadowColor.cgColor
        view.layer.shadowOpacity = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepViewHolderShadowOpacity
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepViewHolderShadowRadius
        return view
    }()

    public var idenfyManualReviewingStatusWaitingStepCompletedTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepFont
        label.textAlignment = .left
        label.textColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepTitleColor
        return label
    }()

    public var idenfyManualReviewingStatusWaitingStepCompletedTick: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_identification_manual_results_waiting_view_completed_step_tick)
        imageView.layer.masksToBounds = true
        return imageView
    }()

    public var idenfyViewHolderManualResultsWaitingViewStepSubmitted: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepViewHolderBackgroundColor
        view.layer.shadowColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepViewHolderShadowColor.cgColor
        view.layer.shadowOpacity = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepViewHolderShadowOpacity
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepViewHolderShadowRadius
        return view
    }()

    public var idenfyManualReviewingStatusWaitingStepSubmittedTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepFont
        label.textAlignment = .left
        label.textColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStepTitleColor
        return label
    }()

    public var idenfyManualReviewingStatusWaitingStepSubmittedTick: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_identification_manual_results_waiting_view_completed_step_tick)
        imageView.layer.masksToBounds = true
        return imageView
    }()

    public var idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingCommonInformationTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor
        return label
    }()

    public var idenfyUILabelManualReviewingStatusApprovedTimerTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingTimerFont
        label.textAlignment = .center
        label.textColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingTimerTitleTextColor
        return label
    }()

    public var idenfyManualReviewingStatusWaitingCommonInformationDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingCommonInformationDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor
        return label
    }()

    public var idenfyUIImageViewManualReviewingStatusWaitingCommonInformationViewHolder: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_manual_reviewing_status_waiting_v2)
        imageView.layer.masksToBounds = true
        return imageView
    }()

    public var idenfyUIButtonManualReviewingStatusWaitingStopWaiting: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingStopWaitingButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    @objc public func setupConstraints() {
        backgroundColor = IdenfyManualReviewingStatusWaitingViewUISettingsV2.idenfyManualReviewingStatusWaitingViewBackgroundColor
        setupToolbar()
        setupStopWaitingIdentificationButton()
        setupScrollView()
        setupCompletedSteps()
        setupTopTitle()
        setupClockImageView()
        setupDescription()
        setupButtonActions()
    }

    private func setupButtonActions() {
        idenfyUIButtonManualReviewingStatusWaitingStopWaiting.addTarget(self, action: #selector(stopWaitingIdentificationButtonPressed), for: .touchUpInside)
    }

    @objc func stopWaitingIdentificationButtonPressed() {
        delegate?.stopWaitingButtonPressedAction()
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

    open func setupScrollView() {
        addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: idenfyToolbarV2Common.safeBottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: idenfyUIButtonManualReviewingStatusWaitingStopWaiting.safeTopAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true

        scrollView.addSubview(scrollViewContentView)

        if #available(iOS 11.0, *) {
            scrollViewContentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
            scrollViewContentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true

            scrollViewContentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true

            scrollViewContentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true

            scrollViewContentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true

            let height = scrollViewContentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)

            height.priority = UILayoutPriority(rawValue: 10)
            height.isActive = true

        } else {
            scrollViewContentView.leftAnchor.constraint(equalTo: scrollView.safeLeftAnchor).isActive = true
            scrollViewContentView.rightAnchor.constraint(equalTo: scrollView.safeRightAnchor).isActive = true
            scrollViewContentView.topAnchor.constraint(equalTo: scrollView.safeTopAnchor).isActive = true
            scrollViewContentView.bottomAnchor.constraint(equalTo: scrollView.safeBottomAnchor).isActive = true
            scrollViewContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

            let height = scrollViewContentView.heightAnchor.constraint(equalToConstant: 800)
            height.priority = UILayoutPriority(200)
            height.isActive = true
        }
    }

    open func setupCompletedSteps() {
        scrollViewContentView.addSubview(idenfyViewHolderManualResultsWaitingViewStepSubmitted)
        idenfyViewHolderManualResultsWaitingViewStepSubmitted.rightAnchor.constraint(equalTo: scrollViewContentView.safeRightAnchor, constant: -24).isActive = true
        idenfyViewHolderManualResultsWaitingViewStepSubmitted.leftAnchor.constraint(equalTo: scrollViewContentView.safeLeftAnchor, constant: 24).isActive = true
        idenfyViewHolderManualResultsWaitingViewStepSubmitted.topAnchor.constraint(equalTo: scrollViewContentView.safeTopAnchor, constant: 24).isActive = true

        idenfyViewHolderManualResultsWaitingViewStepSubmitted.addSubview(idenfyManualReviewingStatusWaitingStepSubmittedTick)
        idenfyManualReviewingStatusWaitingStepSubmittedTick.leftAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepSubmitted.safeLeftAnchor, constant: 8).isActive = true
        idenfyManualReviewingStatusWaitingStepSubmittedTick.topAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepSubmitted.safeTopAnchor, constant: 16).isActive = true
        idenfyManualReviewingStatusWaitingStepSubmittedTick.bottomAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepSubmitted.safeBottomAnchor, constant: -16).isActive = true

        idenfyViewHolderManualResultsWaitingViewStepSubmitted.addSubview(idenfyManualReviewingStatusWaitingStepSubmittedTitle)
        idenfyManualReviewingStatusWaitingStepSubmittedTitle.leftAnchor.constraint(equalTo: idenfyManualReviewingStatusWaitingStepSubmittedTick.safeRightAnchor, constant: 8).isActive = true
        idenfyManualReviewingStatusWaitingStepSubmittedTitle.topAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepSubmitted.safeTopAnchor, constant: 16).isActive = true
        idenfyManualReviewingStatusWaitingStepSubmittedTitle.bottomAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepSubmitted.safeBottomAnchor, constant: -16).isActive = true
        idenfyManualReviewingStatusWaitingStepSubmittedTitle.rightAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepSubmitted.safeRightAnchor).isActive = true

        scrollViewContentView.addSubview(idenfyViewHolderManualResultsWaitingViewStepCompleted)
        idenfyViewHolderManualResultsWaitingViewStepCompleted.rightAnchor.constraint(equalTo: scrollViewContentView.safeRightAnchor, constant: -24).isActive = true
        idenfyViewHolderManualResultsWaitingViewStepCompleted.leftAnchor.constraint(equalTo: scrollViewContentView.safeLeftAnchor, constant: 24).isActive = true
        idenfyViewHolderManualResultsWaitingViewStepCompleted.topAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepSubmitted.bottomAnchor, constant: 8).isActive = true

        idenfyViewHolderManualResultsWaitingViewStepCompleted.addSubview(idenfyManualReviewingStatusWaitingStepCompletedTick)
        idenfyManualReviewingStatusWaitingStepCompletedTick.leftAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepCompleted.safeLeftAnchor, constant: 8).isActive = true
        idenfyManualReviewingStatusWaitingStepCompletedTick.topAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepCompleted.safeTopAnchor, constant: 16).isActive = true
        idenfyManualReviewingStatusWaitingStepCompletedTick.bottomAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepCompleted.safeBottomAnchor, constant: -16).isActive = true

        idenfyViewHolderManualResultsWaitingViewStepCompleted.addSubview(idenfyManualReviewingStatusWaitingStepCompletedTitle)
        idenfyManualReviewingStatusWaitingStepCompletedTitle.leftAnchor.constraint(equalTo: idenfyManualReviewingStatusWaitingStepCompletedTick.safeRightAnchor, constant: 8).isActive = true
        idenfyManualReviewingStatusWaitingStepCompletedTitle.topAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepCompleted.safeTopAnchor, constant: 16).isActive = true
        idenfyManualReviewingStatusWaitingStepCompletedTitle.bottomAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepCompleted.safeBottomAnchor, constant: -16).isActive = true
        idenfyManualReviewingStatusWaitingStepCompletedTitle.rightAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepCompleted.safeRightAnchor).isActive = true
    }

    open func setupTopTitle() {
        scrollViewContentView.addSubview(idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle)
        idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.rightAnchor.constraint(equalTo: scrollViewContentView.safeRightAnchor, constant: -16).isActive = true
        idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.leftAnchor.constraint(equalTo: scrollViewContentView.safeLeftAnchor, constant: 16).isActive = true
        if UIDevice.isIphone5OrBelow {
            idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.topAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepCompleted.bottomAnchor, constant: 16).isActive = true
        } else {
            idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.topAnchor.constraint(equalTo: idenfyViewHolderManualResultsWaitingViewStepCompleted.bottomAnchor, constant: 24).isActive = true
        }

        scrollViewContentView.addSubview(idenfyManualReviewingStatusWaitingCommonInformationDescription)
        idenfyManualReviewingStatusWaitingCommonInformationDescription.rightAnchor.constraint(equalTo: scrollViewContentView.safeRightAnchor, constant: -16).isActive = true
        (idenfyManualReviewingStatusWaitingCommonInformationDescription).leftAnchor.constraint(equalTo: scrollViewContentView.safeLeftAnchor, constant: 16).isActive = true
        if UIDevice.isIphone5OrBelow {
            idenfyManualReviewingStatusWaitingCommonInformationDescription.topAnchor.constraint(equalTo: idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.bottomAnchor, constant: 12).isActive = true
        } else {
            idenfyManualReviewingStatusWaitingCommonInformationDescription.topAnchor.constraint(equalTo: idenfyUILabelManualReviewingStatusApprovedCommonInformationTitle.bottomAnchor, constant: 24).isActive = true
        }
    }

    open func setupStopWaitingIdentificationButton() {
        addSubview(idenfyUIButtonManualReviewingStatusWaitingStopWaiting)
        idenfyUIButtonManualReviewingStatusWaitingStopWaiting.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        idenfyUIButtonManualReviewingStatusWaitingStopWaiting.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        idenfyUIButtonManualReviewingStatusWaitingStopWaiting.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        idenfyUIButtonManualReviewingStatusWaitingStopWaiting.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }

    open func setupClockImageView() {
        scrollViewContentView.addSubview(idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon)
        idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon.widthAnchor.constraint(equalToConstant: 80).isActive = true
        idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon.heightAnchor.constraint(equalToConstant: 80).isActive = true
        idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        if UIDevice.isIphone5OrBelow {
            idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon.topAnchor.constraint(equalTo: idenfyManualReviewingStatusWaitingCommonInformationDescription.bottomAnchor, constant: 16).isActive = true
        } else {
            idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon.topAnchor.constraint(equalTo: idenfyManualReviewingStatusWaitingCommonInformationDescription.bottomAnchor, constant: 24).isActive = true
        }
    }

    open func setupDescription() {
        scrollViewContentView.addSubview(idenfyUILabelManualReviewingStatusApprovedTimerTitle)
        idenfyUILabelManualReviewingStatusApprovedTimerTitle.rightAnchor.constraint(equalTo: scrollViewContentView.safeRightAnchor, constant: -32).isActive = true
        idenfyUILabelManualReviewingStatusApprovedTimerTitle.leftAnchor.constraint(equalTo: scrollViewContentView.safeLeftAnchor, constant: 32).isActive = true
        if UIDevice.isIphone5OrBelow {
            idenfyUILabelManualReviewingStatusApprovedTimerTitle.topAnchor.constraint(equalTo: idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon.bottomAnchor, constant: 8).isActive = true
        } else {
            idenfyUILabelManualReviewingStatusApprovedTimerTitle.topAnchor.constraint(equalTo: idenfyUIImageViewManualReviewingStatusWaitingCommonInformationIcon.bottomAnchor, constant: 32).isActive = true
        }
        let bottom = idenfyUILabelManualReviewingStatusApprovedTimerTitle.bottomAnchor.constraint(equalTo: scrollViewContentView.bottomAnchor, constant: -24)
        bottom.priority = UILayoutPriority.fittingSizeLevel
        bottom.isActive = true
    }
}
