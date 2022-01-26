//
//  ProviderLoginViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-05-04.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import Lottie
import UIKit

@objc open class ProviderLogingViewV2: UIView, ProviderLoginViewableV2 {
    open weak var delegate: ProviderLogingViewButtonActionsDelegate?

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
        return toolbar
    }()

    public var providerLoginTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewTitleTextColor
        return label
    }()

    public var providerLoginDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewDescriptionTextColor
        return label
    }()

    public var providerUsernameHintLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewUsernameHintFont
        label.textAlignment = .left
        label.isHidden = true
        label.textColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewUsernameHintTextColor
        return label
    }()

    public var providerPasswordHintLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewPasswordHintFont
        label.textAlignment = .left
        label.isHidden = true
        label.textColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewPasswordHintTextColor
        return label
    }()

    public var providerUsernameInputView: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            textField.textContentType = .givenName
        }
        textField.font = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewUsernameInputViewFont
        textField.textAlignment = .left
        textField.textColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewUsernameInputViewTextColor
        textField.backgroundColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewUsernameInputViewBackgroundColor
        textField.returnKeyType = .next
        textField.layer.cornerRadius = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewUsernameInputViewCorderRadius
        textField.layer.borderWidth = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewUsernameInputBorderWidth
        textField.layer.borderColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewUsernameInputBorderColor.cgColor
        textField.layer.masksToBounds = true
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.isUserInteractionEnabled = true
        textField.tag = 0
        return textField
    }()

    public var providerPasswordInputView: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            textField.textContentType = .password
        }
        textField.font = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewPasswordInputViewFont
        textField.textAlignment = .left
        textField.textColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewPasswordInputViewTextColor
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        textField.backgroundColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewPasswordInputViewBackgroundColor
        textField.layer.cornerRadius = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewPasswordInputViewCorderRadius
        textField.layer.borderWidth = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewPasswordInputBorderWidth
        textField.layer.borderColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewPasswordInputBorderColor.cgColor
        textField.layer.masksToBounds = true
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.isUserInteractionEnabled = true
        textField.tag = 1
        return textField
    }()

    public var providerPasswordVisibilityButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(IdenfyViewUtils.getImage("idenfy_ic_password_visible"), for: .normal)
        button.isHidden = true
        button.isUserInteractionEnabled = true
        return button
    }()

    public var continueButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewContinueButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        button.isUserInteractionEnabled = false
        button.alpha = 0.4
        return button
    }()

    public var continueButtonSpinner: AnimationView = {
        let lottieView = AnimationView(frame: .zero)
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        if let path = IdenfyViewUtils.getResourcePath(name: "idenfy_custom_country_loader", type: ResourceType.json) {
            lottieView.animation = Animation.filepath(path)
        }
        lottieView.contentMode = .scaleAspectFit
        lottieView.play()
        lottieView.loopMode = .loop
        lottieView.isHidden = true
        return lottieView
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyLoginSelectionViewUISettingsV2.idenfyProviderLoginViewBackgroundColor
        setupToolbar()
        setupContinueButton()
        setupTopTitle()
        setupCenterTextFields()
        setupButtonActions()
    }

    private func setupButtonActions() {
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        providerPasswordVisibilityButton.addTarget(self, action: #selector(passwordVisibilityButtonPressed), for: .touchUpInside)
    }

    @objc func continueButtonPressed() {
        delegate?.continueButtonPressed()
    }

    @objc func passwordVisibilityButtonPressed() {
        delegate?.providerPasswordVisibilityButtonPressed()
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
        addSubview(providerLoginTitle)
        providerLoginTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        providerLoginTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        providerLoginTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true

        addSubview(providerLoginDescription)
        providerLoginDescription.widthAnchor.constraint(equalTo: providerLoginTitle.widthAnchor, multiplier: 0.8).isActive = true
        providerLoginDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        providerLoginDescription.topAnchor.constraint(equalTo: providerLoginTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupContinueButton() {
        addSubview(continueButton)
        continueButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        continueButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 42).isActive = true

        addSubview(continueButtonSpinner)
        continueButtonSpinner.centerYAnchor.constraint(equalTo: continueButton.centerYAnchor).isActive = true
        continueButtonSpinner.leftAnchor.constraint(equalTo: continueButton.safeLeftAnchor, constant: 16).isActive = true
        continueButtonSpinner.widthAnchor.constraint(equalToConstant: 25).isActive = true
        continueButtonSpinner.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

    open func setupCenterTextFields() {
        addSubview(providerUsernameInputView)
        providerUsernameInputView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -60).isActive = true
        providerUsernameInputView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        providerUsernameInputView.leftAnchor.constraint(equalTo: continueButton.leftAnchor, constant: 24).isActive = true
        providerUsernameInputView.rightAnchor.constraint(equalTo: continueButton.rightAnchor, constant: -24).isActive = true

        addSubview(providerPasswordInputView)
        providerPasswordInputView.topAnchor.constraint(equalTo: providerUsernameInputView.bottomAnchor, constant: 16).isActive = true
        providerPasswordInputView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        providerPasswordInputView.leftAnchor.constraint(equalTo: continueButton.leftAnchor, constant: 24).isActive = true
        providerPasswordInputView.rightAnchor.constraint(equalTo: continueButton.rightAnchor, constant: -24).isActive = true

        addSubview(providerUsernameHintLabel)
        providerUsernameHintLabel.topAnchor.constraint(equalTo: providerUsernameInputView.topAnchor, constant: 2).isActive = true
        providerUsernameHintLabel.leftAnchor.constraint(equalTo: providerUsernameInputView.safeLeftAnchor, constant: 10).isActive = true
        providerUsernameHintLabel.rightAnchor.constraint(equalTo: providerUsernameInputView.safeRightAnchor).isActive = true

        addSubview(providerPasswordHintLabel)
        providerPasswordHintLabel.topAnchor.constraint(equalTo: providerPasswordInputView.topAnchor, constant: 2).isActive = true
        providerPasswordHintLabel.leftAnchor.constraint(equalTo: providerPasswordInputView.safeLeftAnchor, constant: 10).isActive = true
        providerPasswordHintLabel.rightAnchor.constraint(equalTo: providerPasswordInputView.safeRightAnchor).isActive = true

        addSubview(providerPasswordVisibilityButton)
        providerPasswordVisibilityButton.centerYAnchor.constraint(equalTo: providerPasswordInputView.centerYAnchor).isActive = true
        providerPasswordVisibilityButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        providerPasswordVisibilityButton.widthAnchor.constraint(equalTo: providerPasswordVisibilityButton.heightAnchor, multiplier: 1).isActive = true
        providerPasswordVisibilityButton.rightAnchor.constraint(equalTo: providerPasswordInputView.safeRightAnchor, constant: -16).isActive = true
    }
}
