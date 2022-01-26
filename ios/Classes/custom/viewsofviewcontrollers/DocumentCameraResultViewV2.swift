//
//  DocumentCameraResultViewV2.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 2020-01-10.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit

@objc open class DocumentCameraResultViewV2: UIView, CameraResultViewableV2 {
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
        toolbar.backButton.setImage("back".image, for: UIControl.State.normal)
        return toolbar
    }()
    


    public var photoResultTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewTitleColor
        return label
    }()

    public var poweredByIdenfyCard: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = CGFloat(4)
        view.layer.borderWidth = CGFloat(1)
        view.layer.borderColor = IdenfyCommonColors.idenfySecondColorV2.withAlphaComponent(0.1).cgColor
        view.isHidden = true
        return view
    }()

    public var poweredByIdenfyTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewPoweredByIdenfyTitleColor
        label.font = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewPoweredByIdenfyTitleFont
        return label
    }()

    public var photoResultDetailsCard: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = "#F5F6F9".hexColor
        view.layer.cornerRadius = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewDetailsCardCornerRadius
        return view
    }()

    public var photoResultDetailsCardSecond: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = "#F5F6F9".hexColor
        view.layer.cornerRadius = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewDetailsCardCornerRadius
        return view
    }()

    public var photoResultDetailsCardQuestionMark: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = "icon_quiestion".image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var photoResultDetailsCardQuestionMarkSecond: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = "icon_quiestion".image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public var photoResultDetailsCardTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewDetailsCardTitleFont
        label.textAlignment = .left
        label.textColor = "#161617".hexColor
        return label
    }()

    public var photoResultDetailsCardTitleSecond: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewDetailsCardTitleFont
        label.textAlignment = .left
        label.textColor = "#161617".hexColor
        return label
    }()

    public var fileResultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewPhotoCornerRadius
        return imageView
    }()

    public var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = IdenfyButtonsUISettingsV2.idenfyButtonCorderRadius
        button.backgroundColor = "#161617".hexColor
        button.tintColor = "#161617".hexColor
        button.setTitle("Yes, continue", for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()

    public var chooseAnotherFileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewRetakePhotoButtonTextColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 4
        button.layer.borderWidth = IdenfyButtonsUISettingsV2.idenfyChooseAnotherPhotoButtonCornerRadius
        button.layer.borderColor = "#161617".hexColor.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.isHidden = true
        return button
    }()
    
    public var chooseAnotherFileButtonCustom: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleToFill
        button.isUserInteractionEnabled = true
        button.setTitle("Take a new photo", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor("#161617".hexColor, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 4
        button.layer.borderWidth = IdenfyButtonsUISettingsV2.idenfyChooseAnotherPhotoButtonCornerRadius
        button.layer.borderColor = "#161617".hexColor.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()

    @objc open func setupConstraints() {
        backgroundColor = IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewBackgroundColor
        setupToolbar()
        setupButtons()
        setupButtonActions()

        setupImageView()
        setupTitle()
        setupDocumentDetailCards()

        setupPoweredByIdenfyCard()
    }

    private func setupButtonActions() {
        continueButton.addTarget(self, action: #selector(confirmPhotoButtonPressed), for: .touchUpInside)
        chooseAnotherFileButton.addTarget(self, action: #selector(retakePhotoButtonPressed), for: .touchUpInside)
       chooseAnotherFileButtonCustom.addTarget(self, action: #selector(retakePhotoButtonPressed), for: .touchUpInside)
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
        continueButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -24).isActive = true
        continueButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 24).isActive = true
        continueButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -24).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        addSubview(chooseAnotherFileButtonCustom)
        chooseAnotherFileButtonCustom.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -8).isActive = true
        chooseAnotherFileButtonCustom.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 24).isActive = true
        chooseAnotherFileButtonCustom.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -24).isActive = true
        chooseAnotherFileButtonCustom.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }

    private func setupTitle() {
        addSubview(photoResultTitle)
        photoResultTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photoResultTitle.topAnchor.constraint(equalTo: fileResultImageView.bottomAnchor, constant: 12).isActive = true
        photoResultTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        photoResultTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
    }

    private func setupDocumentDetailCards() {
        addSubview(photoResultDetailsCard)
        photoResultDetailsCard.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        photoResultDetailsCard.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        photoResultDetailsCard.topAnchor.constraint(equalTo: photoResultTitle.bottomAnchor, constant: 12).isActive = true
        photoResultDetailsCard.heightAnchor.constraint(equalToConstant: 50).isActive = true

        photoResultDetailsCard.addSubview(photoResultDetailsCardQuestionMark)
        photoResultDetailsCardQuestionMark.leftAnchor.constraint(equalTo: photoResultDetailsCard.safeLeftAnchor, constant: 16).isActive = true
        photoResultDetailsCardQuestionMark.topAnchor.constraint(equalTo: photoResultDetailsCard.safeTopAnchor).isActive = true
        photoResultDetailsCardQuestionMark.bottomAnchor.constraint(equalTo: photoResultDetailsCard.safeBottomAnchor).isActive = true

        photoResultDetailsCard.addSubview(photoResultDetailsCardTitle)
        photoResultDetailsCardTitle.leftAnchor.constraint(equalTo: photoResultDetailsCard.safeLeftAnchor, constant: 50).isActive = true
        photoResultDetailsCardTitle.rightAnchor.constraint(equalTo: photoResultDetailsCard.safeRightAnchor, constant: -24).isActive = true
        photoResultDetailsCardTitle.topAnchor.constraint(equalTo: photoResultDetailsCard.safeTopAnchor).isActive = true
        photoResultDetailsCardTitle.bottomAnchor.constraint(equalTo: photoResultDetailsCard.safeBottomAnchor).isActive = true

        addSubview(photoResultDetailsCardSecond)
        photoResultDetailsCardSecond.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        photoResultDetailsCardSecond.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        photoResultDetailsCardSecond.topAnchor.constraint(equalTo: photoResultDetailsCard.bottomAnchor, constant: 16).isActive = true
        photoResultDetailsCardSecond.heightAnchor.constraint(equalToConstant: 50).isActive = true
        let bottomConstraint = photoResultDetailsCardSecond.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -16)
        bottomConstraint.priority = .fittingSizeLevel
        bottomConstraint.isActive = true

        photoResultDetailsCardSecond.addSubview(photoResultDetailsCardQuestionMarkSecond)
        photoResultDetailsCardQuestionMarkSecond.leftAnchor.constraint(equalTo: photoResultDetailsCardSecond.safeLeftAnchor, constant: 16).isActive = true
        photoResultDetailsCardQuestionMarkSecond.topAnchor.constraint(equalTo: photoResultDetailsCardSecond.safeTopAnchor).isActive = true
        photoResultDetailsCardQuestionMarkSecond.bottomAnchor.constraint(equalTo: photoResultDetailsCardSecond.safeBottomAnchor).isActive = true

        photoResultDetailsCardSecond.addSubview(photoResultDetailsCardTitleSecond)
        photoResultDetailsCardTitleSecond.leftAnchor.constraint(equalTo: photoResultDetailsCardSecond.safeLeftAnchor, constant: 50).isActive = true
        photoResultDetailsCardTitleSecond.rightAnchor.constraint(equalTo: photoResultDetailsCardSecond.safeRightAnchor, constant: -24).isActive = true
        photoResultDetailsCardTitleSecond.topAnchor.constraint(equalTo: photoResultDetailsCardSecond.safeTopAnchor).isActive = true
        photoResultDetailsCardTitleSecond.bottomAnchor.constraint(equalTo: photoResultDetailsCardSecond.safeBottomAnchor).isActive = true
    }

    private func setupFaceDetailCard() {
        addSubview(photoResultDetailsCard)
        photoResultDetailsCard.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 32).isActive = true
        photoResultDetailsCard.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -32).isActive = true
        photoResultDetailsCard.bottomAnchor.constraint(equalTo: continueButton.safeTopAnchor, constant: -24).isActive = true
        photoResultDetailsCard.heightAnchor.constraint(equalToConstant: 50).isActive = true

        photoResultDetailsCard.addSubview(photoResultDetailsCardQuestionMark)
        photoResultDetailsCardQuestionMark.leftAnchor.constraint(equalTo: photoResultDetailsCard.safeLeftAnchor, constant: 16).isActive = true
        photoResultDetailsCardQuestionMark.topAnchor.constraint(equalTo: photoResultDetailsCard.safeTopAnchor).isActive = true
        photoResultDetailsCardQuestionMark.bottomAnchor.constraint(equalTo: photoResultDetailsCard.safeBottomAnchor).isActive = true

        photoResultDetailsCard.addSubview(photoResultDetailsCardTitle)
        photoResultDetailsCardTitle.leftAnchor.constraint(equalTo: photoResultDetailsCard.safeLeftAnchor, constant: 50).isActive = true
        photoResultDetailsCardTitle.rightAnchor.constraint(equalTo: photoResultDetailsCard.safeRightAnchor, constant: -24).isActive = true
        photoResultDetailsCardTitle.topAnchor.constraint(equalTo: photoResultDetailsCard.safeTopAnchor).isActive = true
        photoResultDetailsCardTitle.bottomAnchor.constraint(equalTo: photoResultDetailsCard.safeBottomAnchor).isActive = true
    }

    private func setupFaceTitle() {
        addSubview(photoResultTitle)
        photoResultTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photoResultTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        photoResultTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        photoResultTitle.bottomAnchor.constraint(equalTo: photoResultDetailsCard.safeTopAnchor, constant: -12).isActive = true
    }

    private func setupImageView() {
        addSubview(fileResultImageView)
        fileResultImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fileResultImageView.topAnchor.constraint(equalTo: toolbar.topAnchor, constant: 54).isActive = true

        let height = fileResultImageView.heightAnchor.constraint(equalToConstant: 0)
        height.identifier = "photoHeight"
        height.isActive = true

        let width = fileResultImageView.widthAnchor.constraint(equalToConstant: 0)
        width.identifier = "photoWidth"
        width.isActive = true
    }

    private func setupFaceImageView() {
        addSubview(fileResultImageView)
        let topConstraint = fileResultImageView.topAnchor.constraint(equalTo: toolbar.topAnchor, constant: 54)
        topConstraint.isActive = true
        let bottomConstraint = fileResultImageView.bottomAnchor.constraint(equalTo: photoResultTitle.topAnchor, constant: -12)
        bottomConstraint.isActive = true
        fileResultImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        fileResultImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        fileResultImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    private func setupPoweredByIdenfyCard() {
        addSubview(poweredByIdenfyCard)
        poweredByIdenfyCard.topAnchor.constraint(equalTo: fileResultImageView.topAnchor, constant: -15).isActive = true
        poweredByIdenfyCard.heightAnchor.constraint(equalToConstant: 30).isActive = true
        poweredByIdenfyCard.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        poweredByIdenfyCard.addSubview(poweredByIdenfyTitle)
        poweredByIdenfyTitle.leftAnchor.constraint(equalTo: poweredByIdenfyCard.safeLeftAnchor, constant: 16).isActive = true
        poweredByIdenfyTitle.rightAnchor.constraint(equalTo: poweredByIdenfyCard.safeRightAnchor, constant: -16).isActive = true
        poweredByIdenfyTitle.topAnchor.constraint(equalTo: poweredByIdenfyCard.safeTopAnchor, constant: 8).isActive = true
        poweredByIdenfyTitle.bottomAnchor.constraint(equalTo: poweredByIdenfyCard.safeBottomAnchor, constant: -8).isActive = true
    }
}
