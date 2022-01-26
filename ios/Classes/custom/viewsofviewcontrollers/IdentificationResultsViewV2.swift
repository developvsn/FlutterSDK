//
//  IdentificationResultsViewV2.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 2019-12-05.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class IdentificationResultsViewV2: UIView, IdentificationResultsViewableV2 {
    open weak var delegate: IdentificationResultViewButtonActionsDelegate?

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
        toolbar.logo = UIImageView()
        toolbar.logo.isHidden = true
        toolbar.isHidden = true
        return toolbar
    }()

    public var resultsTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewTitleTextColor
        return label
    }()

    public var resultsDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDescriptionTextColor
        return label
    }()

    public var spinnerScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isUserInteractionEnabled = true
        scroll.bounces = false
        return scroll
    }()

    public var resultStepTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bounces = false
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        return tableView
    }()

    public var retakeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewRetakeButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    public var scrollMask: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()

    public var livenessMask: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.isHidden = true
        view.backgroundColor = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewBackgroundColor
        return view
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupRetakeButton()
        setupScrollView()
        setupResultsTableView()
        setupButtonActions()
        setupLivenessMask()
    }

    private func setupButtonActions() {
        retakeButton.addTarget(self, action: #selector(errorButtonPressed), for: .touchUpInside)
    }

    @objc func errorButtonPressed() {
        delegate?.errorButtonPressed()
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
        addSubview(resultsTitle)
        resultsTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -8).isActive = true
        resultsTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 8).isActive = true
        resultsTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 4).isActive = true
        resultsTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true

        addSubview(resultsDescription)
        resultsDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        resultsDescription.heightAnchor.constraint(equalToConstant: 40).isActive = true
        resultsDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resultsDescription.topAnchor.constraint(equalTo: resultsTitle.bottomAnchor, constant: 5).isActive = true
    }

    open func setupRetakeButton() {
        addSubview(retakeButton)
        retakeButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        retakeButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        retakeButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        let heightAnchor = retakeButton.heightAnchor.constraint(equalToConstant: 0)
        heightAnchor.identifier = "retakeHeight"
        heightAnchor.isActive = true
    }

    open func setupScrollView() {
        addSubview(spinnerScrollView)
        spinnerScrollView.topAnchor.constraint(equalTo: resultsDescription.bottomAnchor, constant: 12).isActive = true
        spinnerScrollView.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        spinnerScrollView.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
        spinnerScrollView.bottomAnchor.constraint(equalTo: retakeButton.topAnchor, constant: -16).isActive = true

        addSubview(scrollMask)
        scrollMask.topAnchor.constraint(equalTo: spinnerScrollView.topAnchor).isActive = true
        scrollMask.leftAnchor.constraint(equalTo: spinnerScrollView.leftAnchor).isActive = true
        scrollMask.rightAnchor.constraint(equalTo: spinnerScrollView.rightAnchor).isActive = true
        scrollMask.bottomAnchor.constraint(equalTo: spinnerScrollView.bottomAnchor).isActive = true
    }

    open func setupResultsTableView() {
        spinnerScrollView.addSubview(resultStepTableView)
        resultStepTableView.topAnchor.constraint(equalTo: spinnerScrollView.topAnchor).isActive = true
        resultStepTableView.leftAnchor.constraint(equalTo: spinnerScrollView.leftAnchor).isActive = true
        resultStepTableView.rightAnchor.constraint(equalTo: spinnerScrollView.rightAnchor).isActive = true
        resultStepTableView.widthAnchor.constraint(equalTo: spinnerScrollView.widthAnchor).isActive = true
    }

    open func setupLivenessMask() {
        addSubview(livenessMask)
        livenessMask.topAnchor.constraint(equalTo: toolbar.safeBottomAnchor).isActive = true
        livenessMask.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        livenessMask.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true
        livenessMask.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
    }
}

@objc open class ResultsStepCell: UITableViewCell, ResultsStepCellViewable {
    public let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var stepTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDocumentStepTitleFont
        label.text = "step"
        label.textAlignment = .left
        label.textColor = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDocumentStepTitleTextColor
        return label
    }()

    public var stepSpinnerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isOpaque = true
        imageView.isHidden = true
        return imageView
    }()

    public var stepPulsator: UIView = {
        let pulsatorView = UIView()
        pulsatorView.translatesAutoresizingMaskIntoConstraints = false
        pulsatorView.backgroundColor = .clear
        let pulsator = IdenfyPulsator()
        pulsator.radius = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDocumentStepLoadingSpinnerRadius
        pulsator.numPulse = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDocumentStepLoadingSpinnerNumberOfPulses
        pulsator.animationDuration = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAnimationDuration
        pulsator.backgroundColor = IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor.cgColor
        pulsatorView.layer.addSublayer(pulsator)
        pulsator.position = CGPoint(x: 29, y: 29)
        pulsator.start()
        return pulsatorView
    }()

    public var stepDividerImageViewTop: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isOpaque = true
        return imageView
    }()

    public var stepDividerImageViewBottom: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isOpaque = true
        return imageView
    }()

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupView() {
        addSubview(cellView)
        cellView.topAnchor.constraint(equalTo: safeTopAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true
        cellView.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
        cellView.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true

        cellView.addSubview(stepDividerImageViewTop)
        stepDividerImageViewTop.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        stepDividerImageViewTop.topAnchor.constraint(equalTo: cellView.safeTopAnchor, constant: 2).isActive = true
        stepDividerImageViewTop.heightAnchor.constraint(equalToConstant: 10).isActive = true
        stepDividerImageViewTop.widthAnchor.constraint(equalToConstant: 2).isActive = true

        cellView.addSubview(stepPulsator)
        stepPulsator.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        stepPulsator.topAnchor.constraint(equalTo: stepDividerImageViewTop.bottomAnchor, constant: 12).isActive = true
        stepPulsator.widthAnchor.constraint(equalToConstant: 58).isActive = true
        stepPulsator.heightAnchor.constraint(equalToConstant: 58).isActive = true

        cellView.addSubview(stepSpinnerImageView)
        stepSpinnerImageView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        stepSpinnerImageView.topAnchor.constraint(equalTo: stepDividerImageViewTop.bottomAnchor, constant: 10).isActive = true
        stepSpinnerImageView.widthAnchor.constraint(equalToConstant: 58).isActive = true
        stepSpinnerImageView.heightAnchor.constraint(equalToConstant: 58).isActive = true

        cellView.addSubview(stepTitle)
        stepTitle.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        stepTitle.topAnchor.constraint(equalTo: stepPulsator.bottomAnchor).isActive = true

        cellView.addSubview(stepDividerImageViewBottom)
        stepDividerImageViewBottom.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        stepDividerImageViewBottom.topAnchor.constraint(equalTo: stepTitle.bottomAnchor, constant: 4).isActive = true
        stepDividerImageViewBottom.heightAnchor.constraint(equalToConstant: 10).isActive = true
        stepDividerImageViewBottom.widthAnchor.constraint(equalToConstant: 2).isActive = true
        stepDividerImageViewBottom.bottomAnchor.constraint(equalTo: cellView.safeBottomAnchor).isActive = true
    }
}
