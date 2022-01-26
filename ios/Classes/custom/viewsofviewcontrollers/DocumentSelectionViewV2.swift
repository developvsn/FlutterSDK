//
//  DocumentSelectionViewV2.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 2019-11-29.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class DocumentSelectionViewV2: UIView, DocumentSelectionViewableV2 {
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

    public var documentSelectionTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewTitleTextColor
        return label
    }()

    public var documentSelectionDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDescriptionTextColor
        return label
    }()

    public var emptyArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    public var documentTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bounces = false
        tableView.isScrollEnabled = false
        tableView.allowsMultipleSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.backgroundColor = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewBackgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewCornerRadius
        tableView.layer.borderWidth = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewBorderWidth
        tableView.layer.borderColor = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewBorderColor.cgColor
        return tableView
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupDocumentTableView()
    }

    private func setupToolbar() {
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

    private func setupTopTitle() {
        addSubview(documentSelectionTitle)
        documentSelectionTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        documentSelectionTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        documentSelectionTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true

        addSubview(documentSelectionDescription)
        documentSelectionDescription.widthAnchor.constraint(equalTo: documentSelectionTitle.widthAnchor, multiplier: 0.8).isActive = true
        documentSelectionDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        documentSelectionDescription.topAnchor.constraint(equalTo: documentSelectionTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupDocumentTableView() {
        addSubview(emptyArea)
        emptyArea.topAnchor.constraint(equalTo: documentSelectionDescription.bottomAnchor).isActive = true
        emptyArea.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true
        emptyArea.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        emptyArea.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true

        addSubview(documentTableView)
        documentTableView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 24).isActive = true
        documentTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -24).isActive = true
        documentTableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        documentTableView.topAnchor.constraint(equalTo: emptyArea.safeTopAnchor, constant: 32).isActive = true
        let bottom = documentTableView.bottomAnchor.constraint(equalTo: emptyArea.safeBottomAnchor, constant: -16)
        bottom.priority = UILayoutPriority.fittingSizeLevel
        bottom.isActive = true
    }
}
