//
//  ConfirmationViewV2.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 2019-11-20.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class ConfirmationViewV2: UIView, ConfirmationViewableV2 {
    open weak var delegate: ConfirmationViewButtonActionsDelegate?

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

    public var confirmationTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewTitleTextColor
        return label
    }()

    public var confirmationDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewDescriptionTextColor
        return label
    }()

    public var documentTypeCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "idenfy_ic_confirmation_document_circle", in: Bundle(identifier: "com.idenfy.idenfyviews"), compatibleWith: nil)
        return imageView
    }()

    public var documentTypeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var documentStepTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewDocumentStepTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewDocumentStepTitleTextColor
        return label
    }()

    public var documentStepTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bounces = false
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.backgroundColor = .clear
        return tableView
    }()

    public var uploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "idenfy_ic_confirmation_upload_photo", in: Bundle(identifier: "com.idenfy.idenfyviews"), compatibleWith: nil)
        return imageView
    }()

    public var uploadTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewUploadTitleFont
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewUploadDocumentPhotoTitleTextColor
        return label
    }()

    public var beginIdentificationButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewBeginIdentificationButtonTextColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    public var middleContentScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isUserInteractionEnabled = true
        scroll.bounces = false
        return scroll
    }()

    public var scrollMask: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.isHidden = true
        return view
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupBeginIdentificationButton()
        setupMiddleContentScrollView()
        setupMiddleContentView()
        setupButtonActions()
    }

    private func setupButtonActions() {
        beginIdentificationButton.addTarget(self, action: #selector(beginIdentificationButtonPressed), for: .touchUpInside)
    }

    @objc func beginIdentificationButtonPressed() {
        delegate?.beginIdentificationButtonPressed()
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
        addSubview(confirmationTitle)
        confirmationTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        confirmationTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        confirmationTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true

        addSubview(confirmationDescription)
        confirmationDescription.widthAnchor.constraint(equalTo: confirmationTitle.widthAnchor, multiplier: 0.8).isActive = true
        confirmationDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        confirmationDescription.topAnchor.constraint(equalTo: confirmationTitle.bottomAnchor, constant: 16).isActive = true
    }

    private func setupBeginIdentificationButton() {
        addSubview(beginIdentificationButton)
        beginIdentificationButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        beginIdentificationButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        beginIdentificationButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        beginIdentificationButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }

    private func setupMiddleContentScrollView() {
        addSubview(middleContentScrollView)
        middleContentScrollView.topAnchor.constraint(equalTo: confirmationDescription.bottomAnchor, constant: 16).isActive = true
        middleContentScrollView.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        middleContentScrollView.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
        middleContentScrollView.bottomAnchor.constraint(equalTo: beginIdentificationButton.topAnchor, constant: -8).isActive = true

        addSubview(scrollMask)
        scrollMask.centerXAnchor.constraint(equalTo: middleContentScrollView.centerXAnchor).isActive = true
        scrollMask.centerYAnchor.constraint(equalTo: middleContentScrollView.centerYAnchor).isActive = true
        scrollMask.widthAnchor.constraint(equalTo: middleContentScrollView.widthAnchor).isActive = true
        scrollMask.heightAnchor.constraint(equalTo: middleContentScrollView.heightAnchor).isActive = true
    }

    private func setupMiddleContentView() {
        middleContentScrollView.addSubview(documentTypeCircle)
        documentTypeCircle.topAnchor.constraint(equalTo: middleContentScrollView.topAnchor, constant: 8).isActive = true
        documentTypeCircle.centerXAnchor.constraint(equalTo: middleContentScrollView.centerXAnchor).isActive = true
        documentTypeCircle.widthAnchor.constraint(equalTo: middleContentScrollView.widthAnchor, multiplier: 0.3).isActive = true
        documentTypeCircle.heightAnchor.constraint(equalTo: documentTypeCircle.widthAnchor, multiplier: 1).isActive = true

        middleContentScrollView.addSubview(documentTypeImageView)
        documentTypeImageView.heightAnchor.constraint(equalTo: documentTypeCircle.heightAnchor, multiplier: 0.7).isActive = true
        documentTypeImageView.centerYAnchor.constraint(equalTo: documentTypeCircle.centerYAnchor).isActive = true
        documentTypeImageView.widthAnchor.constraint(equalTo: documentTypeCircle.widthAnchor, multiplier: 0.7).isActive = true
        documentTypeImageView.centerXAnchor.constraint(equalTo: documentTypeCircle.centerXAnchor).isActive = true

        middleContentScrollView.addSubview(documentStepTitle)
        documentStepTitle.centerXAnchor.constraint(equalTo: middleContentScrollView.centerXAnchor).isActive = true
        documentStepTitle.topAnchor.constraint(equalTo: documentTypeCircle.bottomAnchor, constant: 24).isActive = true

        middleContentScrollView.addSubview(documentStepTableView)
        documentStepTableView.topAnchor.constraint(equalTo: documentStepTitle.bottomAnchor, constant: 16).isActive = true
        if UIDevice.current.userInterfaceIdiom == .pad {
            NSLayoutConstraint(item: documentStepTableView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        } else {
            NSLayoutConstraint(item: documentStepTableView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.2, constant: 0).isActive = true
        }
        documentStepTableView.widthAnchor.constraint(equalTo: documentStepTitle.widthAnchor, multiplier: 1.5).isActive = true

        middleContentScrollView.addSubview(uploadImageView)
        uploadImageView.centerXAnchor.constraint(equalTo: middleContentScrollView.centerXAnchor).isActive = true
        uploadImageView.topAnchor.constraint(equalTo: documentStepTableView.bottomAnchor, constant: 24).isActive = true
        uploadImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        uploadImageView.heightAnchor.constraint(equalTo: uploadImageView.widthAnchor, multiplier: 1).isActive = true

        middleContentScrollView.addSubview(uploadTitle)
        uploadTitle.leftAnchor.constraint(equalTo: middleContentScrollView.safeLeftAnchor, constant: 32).isActive = true
        uploadTitle.rightAnchor.constraint(equalTo: middleContentScrollView.safeRightAnchor, constant: -32).isActive = true
        uploadTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        uploadTitle.topAnchor.constraint(equalTo: uploadImageView.bottomAnchor, constant: 16).isActive = true
    }
}

@objc open class DocumentStepCell: UITableViewCell, DocumentStepCellViewable {
    public let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    public var documentStepNumber: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewDocumentStepNumberFont
        label.text = "1"
        label.textColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewDocumentStepCellNumberTextColor
        return label
    }()

    public var documentStepLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewDocumentStepFont
        label.text = "Step"
        label.textAlignment = .left
        label.textColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewDocumentStepCellTitleTextColor
        return label
    }()

    public var documentStepCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isOpaque = true
        imageView.image = UIImage(named: "idenfy_ic_confirmation_item_step_circle", in: Bundle(identifier: "com.idenfy.idenfyviews"), compatibleWith: nil)
        return imageView
    }()

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setupView() {
        addSubview(cellView)
        cellView.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        cellView.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
        cellView.topAnchor.constraint(equalTo: safeTopAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true

        cellView.addSubview(documentStepCircle)
        documentStepCircle.topAnchor.constraint(equalTo: cellView.safeTopAnchor).isActive = true
        documentStepCircle.bottomAnchor.constraint(equalTo: cellView.safeBottomAnchor).isActive = true
        documentStepCircle.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        documentStepCircle.leftAnchor.constraint(equalTo: cellView.safeLeftAnchor, constant: 8).isActive = true

        cellView.addSubview(documentStepLabel)
        documentStepLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        documentStepLabel.leftAnchor.constraint(equalTo: documentStepCircle.rightAnchor, constant: 8).isActive = true
        documentStepLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65).isActive = true

        cellView.addSubview(documentStepNumber)
        documentStepNumber.centerXAnchor.constraint(equalTo: documentStepCircle.centerXAnchor).isActive = true
        documentStepNumber.centerYAnchor.constraint(equalTo: documentStepCircle.centerYAnchor).isActive = true
    }
}
