//
//  IdentificationSuccessResultsViewV2.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 2019-12-11.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class IdentificationSuccessResultsViewV2: UIView, IdentificationSuccessResultsViewableV2 {
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
        toolbar.isHidden = true
        return toolbar
    }()

    public var successResultsTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyIdentificationSuccessResultsViewUISettingsV2.idenfyIdentificationSuccessResultsViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyIdentificationSuccessResultsViewUISettingsV2.idenfyIdentificationSuccessResultsViewTitleTextColor
        return label
    }()

    public var successResultsDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyIdentificationSuccessResultsViewUISettingsV2.idenfyIdentificationSuccessResultsViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyIdentificationSuccessResultsViewUISettingsV2.idenfyIdentificationSuccessResultsViewDescriptionTextColor
        return label
    }()

    public var successResultsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_results_view_step_spinner_status_success_v2)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var successResultsCenterLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = IdenfyIdentificationSuccessResultsViewUISettingsV2.idenfyIdentificaionSuccessResultsViewIdentifiedTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyIdentificationSuccessResultsViewUISettingsV2.idenfyIdentificationSuccessResultsViewIdentifiedTitleTextColor
        return label
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyIdentificationSuccessResultsViewUISettingsV2.idenfyIdentificationSuccessResultsViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupCenterImageView()
        setupCenterTitle()
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
        addSubview(successResultsTitle)
        successResultsTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        successResultsTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        successResultsTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true

        addSubview(successResultsDescription)
        successResultsDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        successResultsDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        successResultsDescription.topAnchor.constraint(equalTo: successResultsTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupCenterImageView() {
        addSubview(successResultsImageView)
        successResultsImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        successResultsImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        successResultsImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        successResultsImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }

    open func setupCenterTitle() {
        addSubview(successResultsCenterLabel)
        successResultsCenterLabel.topAnchor.constraint(equalTo: successResultsImageView.bottomAnchor, constant: 32).isActive = true
        successResultsCenterLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
