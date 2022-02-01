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
import idenfycore
import UIKit
import Lottie
import SnapKit

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
        toolbar.languageSelectionButton.setImage(UIImage(), for: .normal)
        toolbar.backButton.setImage("back".image, for: .normal)
        toolbar.logo.image = UIImage()
        toolbar.backgroundColor = IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewBackgroundColor
        toolbar.toolbarView.layer.shadowColor = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowColor.cgColor
        toolbar.toolbarView.layer.shadowOpacity = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowOpacity
        toolbar.toolbarView.layer.shadowRadius = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowRadius
        toolbar.toolbarView.layer.shadowOffset = CGSize(width: 0, height: 0)
        return toolbar
    }()

    public var documentSelectionTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .left
        label.textColor = IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewTitleTextColor
        return label
    }()

    public var documentSelectionDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.minimumScaleFactor = 0.5
        label.textColor = "#494949".hexColor
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
        tableView.rowHeight = 66
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.allowsMultipleSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    open func setupConstraints() {
        backgroundColor = .white
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
        documentSelectionTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 38).isActive = true
        documentSelectionTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: -45).isActive = true

        addSubview(documentSelectionDescription)
     //   documentSelectionDescription.widthAnchor.constraint(equalTo: documentSelectionTitle.widthAnchor, multiplier: 0.8).isActive = true
        documentSelectionDescription.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 38).isActive = true
        documentSelectionDescription.topAnchor.constraint(equalTo: documentSelectionTitle.bottomAnchor, constant: 1).isActive = true
    }

    open func setupDocumentTableView() {
        addSubview(emptyArea)
        emptyArea.topAnchor.constraint(equalTo: documentSelectionDescription.bottomAnchor).isActive = true
        emptyArea.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true
        emptyArea.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
        emptyArea.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true

        addSubview(documentTableView)
        documentTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(emptyArea.snp.top).offset(32)
        }
//        documentTableView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 24).isActive = true
//        documentTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -24).isActive = true
//        documentTableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        documentTableView.topAnchor.constraint(equalTo: emptyArea.safeTopAnchor, constant: 32).isActive = true
        let bottom = documentTableView.bottomAnchor.constraint(equalTo: emptyArea.safeBottomAnchor, constant: -16)
        bottom.priority = UILayoutPriority.fittingSizeLevel
        bottom.isActive = true
    }
}


@objc open class DocumentCell: UITableViewCell, DocumentCellViewable {
    
    public var loadingSpinner: AnimationView = {
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
    
    private lazy var fullView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
       return view
    }()
    
    public var documentTypeEnum: idenfycore.DocumentTypeEnum!
    public var hasBorder = true

    public var documentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "document"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = "161617".hexColor
        return label
    }()

    public var documentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isOpaque = true
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
        let mScreenSize = UIScreen.main.bounds
            let mSeparatorHeight = CGFloat(10.0) // Change height of speatator as you want
            let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: 0, width: mScreenSize.width, height: mSeparatorHeight))
            mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
        addSubview(mAddSeparator)
        
        addSubview(fullView)
        
        fullView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(54)
        }
        
        fullView.addSubview(documentImageView)
        
        documentImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(29)
            make.centerY.equalToSuperview()
            make.size.equalTo(25)
        }
        
//        documentImageView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: -30).isActive = true
//        documentImageView.topAnchor.constraint(equalTo: safeTopAnchor, constant: 4).isActive = true
//        documentImageView.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -4).isActive = true
//        documentImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        documentImageView.widthAnchor.constraint(equalToConstant: 42).isActive = true

        fullView.addSubview(documentLabel)
        documentLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(documentImageView.snp.trailing).offset(15)
        }
        
        fullView.layer.cornerRadius = 4
        fullView.layer.borderWidth = 1
        fullView.layer.borderColor = "EDEDED".hexColor.cgColor//UIColor.black.cgColor
        
      
//        documentLabel.leftAnchor.constraint(equalTo: documentImageView.leftAnchor, constant: 16).isActive = true
//        documentLabel.topAnchor.constraint(equalTo: safeTopAnchor).isActive = true
//        documentLabel.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true
//        documentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

