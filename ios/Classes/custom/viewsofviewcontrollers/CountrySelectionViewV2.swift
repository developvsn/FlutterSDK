//
//  CountrySelectionViewV2.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 2019-11-27.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import Lottie
import UIKit
import SnapKit

@objc open class CountrySelectionViewV2: UIView, CountrySelectionViewableV2 {
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
        toolbar.backgroundColor = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewBackgroundColor
        toolbar.toolbarView.layer.shadowColor = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowColor.cgColor
        toolbar.toolbarView.layer.shadowOpacity = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowOpacity
        toolbar.toolbarView.layer.shadowRadius = IdenfyToolbarUISettingsV2.idenfyDefaultToolbarShadowRadius
        toolbar.toolbarView.layer.shadowOffset = CGSize(width: 0, height: 0)
        return toolbar
    }()
    

    public var countrySelectionTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .left
        label.textColor = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewTitleTextColor
        return label
    }()

    public var countrySelectionDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.minimumScaleFactor = 0.5
        label.textColor = "#494949".hexColor
        return label
    }()

    public var searchIcon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_country_selection_search)
        return imageView
    }()
    
    public var textEditDivider : UIImageView = {
       let image = UIImageView()
        image.image = "textEditDivider".image
        image.contentMode = .scaleAspectFit
        return image
    }()

    public var countrySearchBarLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = "#FFFFFF".hexColor
        label.font = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewSearchBarHintFont
        return label
    }()

    public var countrySearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.setPositionAdjustment(UIOffset(horizontal: -10, vertical: 0), for: .search)
        let textField = searchBar.value(forKey: "searchField") as? UITextField
        textField?.clearButtonMode = .never
        textField?.backgroundColor = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewCountrySearchBarBackgroundColor
        textField?.textColor = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewCountrySearchBarTextColor
        textField?.font = .systemFont(ofSize: 14, weight: .regular)
        searchBar.semanticContentAttribute = .forceLeftToRight
        searchBar.barTintColor = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewCountrySearchBarBackgroundColor
        searchBar.backgroundColor = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewCountrySearchBarBackgroundColor
        searchBar.backgroundImage = UIImage()
//        searchBar.layer.cornerRadius = IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountrySearchBarCorderRadius
//        searchBar.layer.borderWidth = IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountrySearchBarBorderWidth
//        searchBar.layer.borderColor = IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountrySearchBarBorderColor.cgColor
        return searchBar
    }()

    public var searchBarMask: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    public var findInputDesctiption: UILabel = {
        let label = UILabel()
        label.textColor = "#ADAEAF".hexColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Document’s country"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()

    public var countryTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        tableView.bounces = false
        tableView.isScrollEnabled = true
        tableView.allowsMultipleSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.backgroundColor = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewCountryTableViewBackgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = 6
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = "#E8EAF0".hexColor.cgColor
        return tableView
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupSearchBar()
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
        addSubview(countrySelectionTitle)
      //  countrySelectionTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        countrySelectionTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 38).isActive = true
        countrySelectionTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: -45).isActive = true

        addSubview(countrySelectionDescription)
        //countrySelectionDescription.widthAnchor.constraint(equalTo: countrySelectionTitle.widthAnchor, multiplier: 0.8).isActive = true
        countrySelectionDescription.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 38).isActive = true
        countrySelectionDescription.topAnchor.constraint(equalTo: countrySelectionTitle.bottomAnchor, constant: 1).isActive = true
    }

    open func setupSearchBar() {
       
        addSubview(countrySearchBar)
        countrySearchBar.topAnchor.constraint(equalTo: countrySelectionDescription.bottomAnchor, constant: 48).isActive = true
        countrySearchBar.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        countrySearchBar.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        countrySearchBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        countrySearchBar.heightAnchor.constraint(equalToConstant: 56).isActive = true
       
        
        addSubview(countrySearchBarLabel)
        countrySearchBarLabel.leftAnchor.constraint(equalTo: countrySearchBar.leftAnchor, constant: 16).isActive = true
        countrySearchBarLabel.rightAnchor.constraint(equalTo: countrySearchBar.rightAnchor).isActive = true
        countrySearchBarLabel.topAnchor.constraint(equalTo: countrySearchBar.topAnchor).isActive = true
        countrySearchBarLabel.bottomAnchor.constraint(equalTo: countrySearchBar.bottomAnchor).isActive = true

       
        addSubview(textEditDivider)
        addSubview(findInputDesctiption)
    
        textEditDivider.snp.makeConstraints { make in
            make.top.equalTo(countrySearchBar.snp.bottom).offset(-8)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-27)
            make.height.equalTo(2)
        }
        
        findInputDesctiption.snp.makeConstraints { make in
            make.bottom.equalTo(countrySearchBar.snp.top).offset(11)
            make.leading.equalTo(textEditDivider.snp.leading)
        }
        
//        textEditDivider.leftAnchor.constraint(equalTo: countrySearchBar.leftAnchor).isActive = true
//        textEditDivider.rightAnchor.constraint(equalTo: countrySearchBar.rightAnchor).isActive = true
//        textEditDivider.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 10).isActive = true
//        textEditDivider.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        addSubview(searchBarMask)
        searchBarMask.leftAnchor.constraint(equalTo: countrySearchBar.safeLeftAnchor).isActive = true
        searchBarMask.rightAnchor.constraint(equalTo: countrySearchBar.safeRightAnchor).isActive = true
        searchBarMask.topAnchor.constraint(equalTo: countrySearchBar.safeTopAnchor).isActive = true
        searchBarMask.bottomAnchor.constraint(equalTo: countrySearchBar.safeBottomAnchor).isActive = true
    }

    open func setupCountryTableView() {
        addSubview(countryTableView)
        countryTableView.topAnchor.constraint(equalTo: countrySearchBar.bottomAnchor, constant: 24).isActive = true
        countryTableView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        countryTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        countryTableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        countryTableView.widthAnchor.constraint(equalTo: countrySearchBar.widthAnchor).isActive = true
        countryTableView.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -16).isActive = true
    }
}

@objc open class CountryCell: UITableViewCell, CountryCellViewable {
    public var hasBorder = false

    public let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var countryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "country"
        label.textAlignment = .left
        label.textColor = "#494949".hexColor
        return label
    }()

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

    public var countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isOpaque = true
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = IdenfyCountrySelectionViewUISettingsV3.idenfyCountrySelectionViewCountryFlagBorderWidth
        imageView.layer.borderColor = UIColor.black.cgColor
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
        addSubview(cellView)
        cellView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellView.rightAnchor.constraint(equalTo: safeRightAnchor).isActive = true
        cellView.leftAnchor.constraint(equalTo: safeLeftAnchor).isActive = true
       


        cellView.addSubview(countryLabel)
        countryLabel.leftAnchor.constraint(equalTo: cellView.safeLeftAnchor, constant: 20).isActive = true
        countryLabel.topAnchor.constraint(equalTo: cellView.safeTopAnchor).isActive = true
        countryLabel.bottomAnchor.constraint(equalTo: cellView.safeBottomAnchor).isActive = true
        countryLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
    }
}
