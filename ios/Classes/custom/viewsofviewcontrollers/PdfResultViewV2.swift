//
//  UploadResultViewV2.swift
//  idenfyviews
//
//  Created by Viktas Juskys on 2021-06-01.
//  Copyright © 2021 iDenfy. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class PdfResultViewV2: UIView, PdfResultViewableV2 {
    open weak var delegate: FileResultViewV2ButtonActionsDelegate?

    override public required init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var toolbar: IdenfyToolbarV2CameraSession = {
        let toolbar = IdenfyToolbarV2CameraSession(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    public var pdfResultTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewTitleTextColor
        return label
    }()

    public var pdfResultDetailsCard: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewDetailsCardBackgroundColor
        view.layer.cornerRadius = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewDetailsCardCornerRadius
        return view
    }()

    public var pdfResultDetailsCardQuestionMark: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_photo_result_view_details_card_questionmark)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var pdfResultDetailsCardTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewDetailsCardTitleFont
        label.textAlignment = .left
        label.textColor = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewDetailsCardTitleColor
        return label
    }()

    public var fileResultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()

    public var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    public var chooseAnotherFileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.backgroundColor = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewRetakePdfButtonBackgroundColor
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.layer.borderWidth = IdenfyButtonsUISettingsV2.idenfyChooseAnotherPhotoButtonCornerRadius
        button.layer.borderColor = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewRetakePdfButtonBorderColor.cgColor
        button.titleLabel?.font = IdenfyButtonsUISettingsV2.idenfyButtonFont
        return button
    }()

    @objc open func setupConstraints() {
        backgroundColor = IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewBackgroundColor
        setupToolbar()
        setupButtons()
        setupButtonActions()
        setupImageView()
        setupTitle()
        setupDocumentDetailCards()
    }

    private func setupButtonActions() {
        continueButton.addTarget(self, action: #selector(confirmPhotoButtonPressed), for: .touchUpInside)
        chooseAnotherFileButton.addTarget(self, action: #selector(retakePhotoButtonPressed), for: .touchUpInside)
    }

    @objc func confirmPhotoButtonPressed() {
        delegate?.confirmButtonPressedAction()
    }

    @objc func retakePhotoButtonPressed() {
        delegate?.retakeButtonPressedAction()
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

    private func setupButtons() {
        addSubview(chooseAnotherFileButton)
        chooseAnotherFileButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        chooseAnotherFileButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 24).isActive = true
        chooseAnotherFileButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -24).isActive = true
        chooseAnotherFileButton.heightAnchor.constraint(equalToConstant: 42).isActive = true

        addSubview(continueButton)
        continueButton.bottomAnchor.constraint(equalTo: chooseAnotherFileButton.topAnchor, constant: -16).isActive = true
        continueButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 24).isActive = true
        continueButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -24).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }

    private func setupTitle() {
        addSubview(pdfResultTitle)
        pdfResultTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pdfResultTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        pdfResultTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        pdfResultTitle.topAnchor.constraint(equalTo: fileResultImageView.bottomAnchor, constant: 12).isActive = true
    }

    private func setupDocumentDetailCards() {
        addSubview(pdfResultDetailsCard)
        pdfResultDetailsCard.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        pdfResultDetailsCard.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        pdfResultDetailsCard.topAnchor.constraint(equalTo: pdfResultTitle.bottomAnchor, constant: 12).isActive = true
        pdfResultDetailsCard.heightAnchor.constraint(equalToConstant: 50).isActive = true

        pdfResultDetailsCard.addSubview(pdfResultDetailsCardQuestionMark)
        pdfResultDetailsCardQuestionMark.leftAnchor.constraint(equalTo: pdfResultDetailsCard.safeLeftAnchor, constant: 16).isActive = true
        pdfResultDetailsCardQuestionMark.topAnchor.constraint(equalTo: pdfResultDetailsCard.safeTopAnchor).isActive = true
        pdfResultDetailsCardQuestionMark.bottomAnchor.constraint(equalTo: pdfResultDetailsCard.safeBottomAnchor).isActive = true

        pdfResultDetailsCard.addSubview(pdfResultDetailsCardTitle)
        pdfResultDetailsCardTitle.leftAnchor.constraint(equalTo: pdfResultDetailsCard.safeLeftAnchor, constant: 50).isActive = true
        pdfResultDetailsCardTitle.rightAnchor.constraint(equalTo: pdfResultDetailsCard.safeRightAnchor, constant: -24).isActive = true
        pdfResultDetailsCardTitle.topAnchor.constraint(equalTo: pdfResultDetailsCard.safeTopAnchor).isActive = true
        pdfResultDetailsCardTitle.bottomAnchor.constraint(equalTo: pdfResultDetailsCard.safeBottomAnchor).isActive = true
    }

    private func setupImageView() {
        addSubview(fileResultImageView)
        fileResultImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fileResultImageView.topAnchor.constraint(equalTo: toolbar.topAnchor, constant: 54).isActive = true
        fileResultImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
