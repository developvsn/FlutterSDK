//
//  IssuedCountryViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-03-09.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import idenfyviews
import UIKit
import iDenfySDK
@objc open class SampleAppView: UIView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var toolbar: IdenfyToolbarV2Default = {
        let toolbar = IdenfyToolbarV2Default(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    public var sampleAppTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewTitleTextColor
        return label
    }()

    public var sampleAppDesciption: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewDescriptionTextColor
        return label
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

    private func setupConstraints() {
        backgroundColor = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewBackgroundColor
        setupToolbar()
        setupBeginIdentificationButton()
        setupTopTitle()
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
        toolbar.backButton.isHidden = true
    }

    open func setupTopTitle() {
        addSubview(sampleAppTitle)
        sampleAppTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        sampleAppTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        sampleAppTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true

        addSubview(sampleAppDesciption)
        sampleAppDesciption.widthAnchor.constraint(equalTo: sampleAppTitle.widthAnchor, multiplier: 0.8).isActive = true
        sampleAppDesciption.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        sampleAppDesciption.topAnchor.constraint(equalTo: sampleAppTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupBeginIdentificationButton() {
        addSubview(beginIdentificationButton)
        beginIdentificationButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        beginIdentificationButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        beginIdentificationButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        beginIdentificationButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
}
