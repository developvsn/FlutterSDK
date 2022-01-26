//
//  LanguageSelectionViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2020-03-24.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class LanguageSelectionViewV2: UIView, LanguageSelectionViewableV2 {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var toolbar: IdenfyToolbarV2CloseButton = {
        let toolbar = IdenfyToolbarV2CloseButton(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    public var languageSelectionTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewTitleTextColor
        return label
    }()

    public var languageTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bounces = false
        tableView.isScrollEnabled = true
        tableView.allowsMultipleSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.backgroundColor = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewLanguageTableViewBackgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewLanguageTableViewCornerRadius
        tableView.layer.borderWidth = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewLanguageTableViewBorderWidth
        tableView.layer.borderColor = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewLanguageTableViewBorderColor.cgColor
        return tableView
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupCountryTableView()
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
        addSubview(languageSelectionTitle)
        languageSelectionTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        languageSelectionTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        languageSelectionTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true
    }

    open func setupCountryTableView() {
        addSubview(languageTableView)
        languageTableView.topAnchor.constraint(equalTo: languageSelectionTitle.bottomAnchor, constant: 24).isActive = true
        languageTableView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        languageTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        languageTableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        let bottom = languageTableView.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -16)
        bottom.priority = UILayoutPriority.fittingSizeLevel
        bottom.isActive = true
    }
}

@objc open class LanguageCell: UITableViewCell, LanguageCellViewable {
    public var hasBorder = false

    public var languageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewLanguageTableViewCellFont
        label.text = "language"
        label.textAlignment = .left
        label.textColor = IdenfyLanguageSelectionViewUISettingsV2.idenfyLanguageSelectionViewLanguageTableViewCellTextColor
        return label
    }()

    public var languageSelectedTick: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_language_selection_language_selected_tick)
        return imageView
    }()

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(languageSelectedTick)
        languageSelectedTick.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        languageSelectedTick.topAnchor.constraint(equalTo: safeTopAnchor).isActive = true
        languageSelectedTick.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true
        languageSelectedTick.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        addSubview(languageLabel)
        languageLabel.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        languageLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        languageLabel.topAnchor.constraint(equalTo: safeTopAnchor).isActive = true
        languageLabel.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true
        languageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
