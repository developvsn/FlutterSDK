//
//  IssuedCountryViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-03-09.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class IssuedCountryViewV2: UIView, IssuedCountryViewableV2 {
    open weak var delegate: IssuedCountryViewButtonActionsDelegate?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var toolbar: IdenfyToolbarV2WithLanguageSelection = {
        let toolbar = IdenfyToolbarV2WithLanguageSelection(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    public var countrySelectionTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewTitleTextColor
        return label
    }()

    public var countrySelectionDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewDescriptionTextColor
        return label
    }()

    public var countryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewCountryLabelFont
        label.textAlignment = .left
        label.textColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewCountryLabelTextColor
        return label
    }()

    public var countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isOpaque = true
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewCountryFlagBorderWidth
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()

    public var countryView: UIView = {
        let uiview = UIView(frame: .zero)
        uiview.backgroundColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewCountryViewBackgroundColor
        uiview.translatesAutoresizingMaskIntoConstraints = false
        uiview.layer.cornerRadius = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewCountryViewCorderRadius
        uiview.layer.borderWidth = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewCountryViewBorderWidth
        uiview.layer.borderColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewCountryViewBorderColor.cgColor
        return uiview
    }()

    public var beginIdentificationButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewBeginIdentificationButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewBackgroundColor
        setupToolbar()
        setupBeginIdentificationButton()
        setupTopTitle()
        setupIssuedCountryView()
        setupButtonActions()
    }

    private func setupButtonActions() {
        beginIdentificationButton.addTarget(self, action: #selector(beginIdentificationButtonPressed), for: .touchUpInside)
    }

    @objc func beginIdentificationButtonPressed() {
        delegate?.beginIdentificationButtonPressed()
    }

    /**
      “After async events will be disabled and re-enabled from ViewController.”
     */
    open func disableBeginIdentificationButton() {
        beginIdentificationButton.isUserInteractionEnabled = false
    }

    open func enableBeginIdentificationButton() {
        beginIdentificationButton.isUserInteractionEnabled = true
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
        addSubview(countrySelectionTitle)
        countrySelectionTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        countrySelectionTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        countrySelectionTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true

        addSubview(countrySelectionDescription)
        countrySelectionDescription.widthAnchor.constraint(equalTo: countrySelectionTitle.widthAnchor, multiplier: 0.8).isActive = true
        countrySelectionDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        countrySelectionDescription.topAnchor.constraint(equalTo: countrySelectionTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupBeginIdentificationButton() {
        addSubview(beginIdentificationButton)
        beginIdentificationButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        beginIdentificationButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        beginIdentificationButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        beginIdentificationButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }

    open func setupIssuedCountryView() {
        addSubview(countryView)
        countryView.topAnchor.constraint(equalTo: countrySelectionDescription.bottomAnchor, constant: 48).isActive = true
        countryView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        countryView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        countryView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        countryView.heightAnchor.constraint(equalToConstant: 56).isActive = true

        countryView.addSubview(countryImageView)
        countryImageView.rightAnchor.constraint(equalTo: countryView.safeRightAnchor, constant: -16).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        countryImageView.centerYAnchor.constraint(equalTo: countryView.centerYAnchor).isActive = true

        countryView.addSubview(countryLabel)
        countryLabel.leftAnchor.constraint(equalTo: countryView.safeLeftAnchor, constant: 16).isActive = true
        countryLabel.widthAnchor.constraint(equalTo: countryView.widthAnchor, multiplier: 0.7).isActive = true
        countryLabel.topAnchor.constraint(equalTo: countryView.safeTopAnchor).isActive = true
        countryLabel.bottomAnchor.constraint(equalTo: countryView.safeBottomAnchor).isActive = true
        countryLabel.centerYAnchor.constraint(equalTo: countryView.centerYAnchor).isActive = true
    }
}
