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
import SnapKit
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
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.backButton.setImage("back".image, for: .normal)
        toolbar.logo.image = UIImage()
        toolbar.backgroundColor = IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewBackgroundColor
        toolbar.toolbarView.layer.shadowColor = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowColor.cgColor
        toolbar.toolbarView.layer.shadowOpacity = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowOpacity
        toolbar.toolbarView.layer.shadowRadius = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowRadius
        toolbar.toolbarView.layer.shadowOffset = CGSize(width: 0, height: 0)
        return toolbar
    }()

    public var confirmationTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .left
        label.textColor = IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewTitleTextColor
        return label
    }()

    public var confirmationDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.minimumScaleFactor = 0.5
        label.textColor = "#494949".hexColor
        return label
    }()
    
    public var subLabel: UILabel = {
        let label = UILabel()
        label.textColor = "494949".hexColor
        label.text = "Please have your document ready to identify"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.minimumScaleFactor = 0.5
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
        label.textColor = "161617".hexColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.numberOfLines = 2
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
        tableView.rowHeight = 100
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
        button.titleLabel?.textColor = "#FFFFFF".hexColor
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        button.backgroundColor = "#161617".hexColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()

    public var middleContentScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = "#F5F6F9".hexColor
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
    
    public var stage1image: UIImageView = {
        let image = UIImageView()
        image.image = "stage1".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var stage2image: UIImageView = {
        let image = UIImageView()
        image.image = "stage2".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var stage3image: UIImageView = {
        let image = UIImageView()
        image.image = "stage3".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var verticalDivider1: UIImageView = {
        let image = UIImageView()
        image.image = "verticalDivider".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var verticalDivider2: UIImageView = {
        let image = UIImageView()
        image.image = "verticalDivider".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var stage1label: UILabel = {
        let label = UILabel()
        label.textColor = "161617".hexColor
        label.text = "Document front photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    
    public var stage2label: UILabel = {
        let label = UILabel()
        label.textColor = "161617".hexColor
        label.text = "Document back photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    public var stage3label: UILabel = {
        let label = UILabel()
        label.textColor = "161617".hexColor
        label.text = "Face photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    
    public var instructionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = "161617".hexColor
        label.text = "Identification will take\n 3 steps:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    public lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = "#F5F6F9".hexColor
        return view
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyConfirmationViewUISettingsV2.idenfyDocumentConfirmationViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupBeginIdentificationButton()
       // setupMiddleContentScrollView()
       // setupMiddleContentView()
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
        confirmationTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 38).isActive = true
        confirmationTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: -45).isActive = true

        addSubview(confirmationDescription)
        confirmationDescription.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 38).isActive = true
        confirmationDescription.topAnchor.constraint(equalTo: confirmationTitle.bottomAnchor, constant: 1).isActive = true
        confirmationDescription.isHidden = true
        
        addSubview(subLabel)
        subLabel.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 38).isActive = true
        subLabel.topAnchor.constraint(equalTo: confirmationTitle.bottomAnchor, constant: 1).isActive = true
        
        addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(subLabel.snp.bottom).offset(25)
            make.height.equalTo(542)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
        mainView.addSubview(instructionsLabel)
        mainView.addSubview(stage1image)
        mainView.addSubview(stage1label)
        mainView.addSubview(verticalDivider1)
        mainView.addSubview(stage2image)
        mainView.addSubview(stage2label)
        mainView.addSubview(verticalDivider2)
        mainView.addSubview(stage3image)
        mainView.addSubview(stage3label)
        
        instructionsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65.resized())
            make.centerX.equalToSuperview()
            make.height.equalTo(50.resized())
        }
        
        stage1image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(instructionsLabel.snp.bottom).offset(40.resized())
            make.size.equalTo(36)
        }
        
        stage1label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stage1image.snp.bottom).offset(10)
            make.height.equalTo(17)
        }
        
        verticalDivider1.snp.makeConstraints { make in
            make.top.equalTo(stage1label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(1.5)
            make.height.equalTo(36.resized())
        }
        
        stage2image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(verticalDivider1.snp.bottom).offset(10)
            make.size.equalTo(36)
        }
        
        stage2label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stage2image.snp.bottom).offset(10)
            make.height.equalTo(17)
        }
        
        verticalDivider2.snp.makeConstraints { make in
            make.top.equalTo(stage2label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(1.5)
            make.height.equalTo(36.resized())
        }
        
        stage3image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(verticalDivider2.snp.bottom).offset(10)
            make.size.equalTo(36)
        }
        
        stage3label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stage3image.snp.bottom).offset(10)
            make.height.equalTo(17)
        }
        
        
        
        
        
    }

    private func setupBeginIdentificationButton() {
        addSubview(beginIdentificationButton)
        beginIdentificationButton.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -20).isActive = true
        beginIdentificationButton.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 20).isActive = true
        beginIdentificationButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -20).isActive = true
        beginIdentificationButton.heightAnchor.constraint(equalToConstant: 51).isActive = true
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

//    private func setupMiddleContentView() {
////        middleContentScrollView.addSubview(documentTypeCircle)
////        documentTypeCircle.topAnchor.constraint(equalTo: middleContentScrollView.topAnchor, constant: 8).isActive = true
////        documentTypeCircle.centerXAnchor.constraint(equalTo: middleContentScrollView.centerXAnchor).isActive = true
////        documentTypeCircle.widthAnchor.constraint(equalTo: middleContentScrollView.widthAnchor, multiplier: 0.3).isActive = true
////        documentTypeCircle.heightAnchor.constraint(equalTo: documentTypeCircle.widthAnchor, multiplier: 1).isActive = true
////
////        middleContentScrollView.addSubview(documentTypeImageView)
////        documentTypeImageView.heightAnchor.constraint(equalTo: documentTypeCircle.heightAnchor, multiplier: 0.7).isActive = true
////        documentTypeImageView.centerYAnchor.constraint(equalTo: documentTypeCircle.centerYAnchor).isActive = true
////        documentTypeImageView.widthAnchor.constraint(equalTo: documentTypeCircle.widthAnchor, multiplier: 0.7).isActive = true
////        documentTypeImageView.centerXAnchor.constraint(equalTo: documentTypeCircle.centerXAnchor).isActive = true
//
//        middleContentScrollView.addSubview(documentStepTitle)
//        documentStepTitle.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(65.resized())
//            make.centerX.equalToSuperview()
//            make.height.equalTo(50.resized())
//        }
////        documentStepTitle.centerXAnchor.constraint(equalTo: middleContentScrollView.centerXAnchor).isActive = true
////        documentStepTitle.topAnchor.constraint(equalTo: middleContentScrollView.topAnchor, constant: 24).isActive = true
//
//        middleContentScrollView.addSubview(documentStepTableView)
////        documentStepTableView.snp.makeConstraints { make in
////            make.leading.equalToSuperview().offset(20)
////            make.trailing.equalToSuperview().offset(-20)
////            make.top.equalToSuperview().offset(40)
////            make.height.equalTo(500)
////        }
//        documentStepTableView.topAnchor.constraint(equalTo: documentStepTitle.bottomAnchor, constant: 16).isActive = true
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            NSLayoutConstraint(item: documentStepTableView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//        } else {
//            NSLayoutConstraint(item: documentStepTableView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.2, constant: 0).isActive = true
//        }
//        documentStepTableView.widthAnchor.constraint(equalTo: documentStepTitle.widthAnchor, multiplier: 1.5).isActive = true
//        documentStepTableView.bottomAnchor.constraint(equalTo: middleContentScrollView.bottomAnchor).isActive = true
//
//        middleContentScrollView.addSubview(uploadImageView)
//        uploadImageView.centerXAnchor.constraint(equalTo: middleContentScrollView.centerXAnchor).isActive = true
//        uploadImageView.topAnchor.constraint(equalTo: documentStepTableView.bottomAnchor, constant: 24).isActive = true
//        uploadImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
//        uploadImageView.heightAnchor.constraint(equalTo: uploadImageView.widthAnchor, multiplier: 1).isActive = true
//
//        middleContentScrollView.addSubview(uploadTitle)
//        uploadTitle.leftAnchor.constraint(equalTo: middleContentScrollView.safeLeftAnchor, constant: 32).isActive = true
//        uploadTitle.rightAnchor.constraint(equalTo: middleContentScrollView.safeRightAnchor, constant: -32).isActive = true
//        uploadTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        uploadTitle.topAnchor.constraint(equalTo: uploadImageView.bottomAnchor, constant: 16).isActive = true
//    }

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
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "1"
        label.textColor = "#161617".hexColor
        return label
    }()

    public var documentStepLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = "161617".hexColor
        label.text = "Step"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        return label
    }()

    public var documentStepCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isOpaque = true
        imageView.image = UIImage(named: "idenfy_ic_confirmation_item_step_circle", in: Bundle(identifier: "com.idenfy.idenfyviews"), compatibleWith: nil)
        imageView.setImageColor("#FFC700".hexColor)
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
        documentStepCircle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(34)
        }
        
        
//        documentStepCircle.topAnchor.constraint(equalTo: cellView.safeTopAnchor).isActive = true
//        documentStepCircle.bottomAnchor.constraint(equalTo: cellView.safeBottomAnchor).isActive = true
//        documentStepCircle.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
//        documentStepCircle.leftAnchor.constraint(equalTo: cellView.safeLeftAnchor, constant: 8).isActive = true
        cellView.addSubview(documentStepLabel)
        
        documentStepLabel.snp.makeConstraints { make in
            make.top.equalTo(documentStepCircle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
//        documentStepLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
//        documentStepLabel.leftAnchor.constraint(equalTo: documentStepCircle.rightAnchor, constant: 8).isActive = true
//        documentStepLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65).isActive = true

        cellView.addSubview(documentStepNumber)
        documentStepNumber.centerXAnchor.constraint(equalTo: documentStepCircle.centerXAnchor).isActive = true
        documentStepNumber.centerYAnchor.constraint(equalTo: documentStepCircle.centerYAnchor).isActive = true
    }
}
