//
//  ProviderSelectionViewV2.swift
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

@objc open class ProviderSelectionViewV2: UIView, ProviderSelectionViewableV2 {
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

    public var providerSelectionTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewTitleTextColor
        return label
    }()

    public var providerSelectionDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewDescriptionFont
        label.textAlignment = .center
        label.textColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewDescriptionTextColor
        return label
    }()

    public var searchIcon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_country_selection_search)
        return imageView
    }()

    public var providerSearchBarLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderSearchBarHintTextColor
        label.font = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewSearchBarHintFont
        return label
    }()

    public var providerSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.setPositionAdjustment(UIOffset(horizontal: -10, vertical: 0), for: .search)
        let textField = searchBar.value(forKey: "searchField") as? UITextField
        textField?.clearButtonMode = .never
        textField?.backgroundColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderSearchBarBackgroundColor
        textField?.textColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderSearchBarTextColor
        textField?.font = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewSearchBarFont
        searchBar.semanticContentAttribute = .forceLeftToRight
        searchBar.barTintColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderSearchBarBackgroundColor
        searchBar.backgroundColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderSearchBarBackgroundColor
        searchBar.backgroundImage = UIImage()
        searchBar.layer.cornerRadius = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderSearchBarCorderRadius
        searchBar.layer.borderWidth = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderSearchBarBorderWidth
        searchBar.layer.borderColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderSearchBarBorderColor.cgColor
        return searchBar
    }()

    public var searchBarMask: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    public var providerTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        tableView.bounces = false
        tableView.isScrollEnabled = true
        tableView.allowsMultipleSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.backgroundColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderTableViewBackgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderTableViewCornerRadius
        tableView.layer.borderWidth = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderTableViewBorderWidth
        tableView.layer.borderColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderTableViewBorderColor.cgColor
        return tableView
    }()

    open func setupConstraints() {
        backgroundColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewBackgroundColor
        setupToolbar()
        setupTopTitle()
        setupSearchBar()
        setupProviderTableView()
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
        addSubview(providerSelectionTitle)
        providerSelectionTitle.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        providerSelectionTitle.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        providerSelectionTitle.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 24).isActive = true

        addSubview(providerSelectionDescription)
        providerSelectionDescription.widthAnchor.constraint(equalTo: providerSelectionTitle.widthAnchor, multiplier: 0.8).isActive = true
        providerSelectionDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        providerSelectionDescription.topAnchor.constraint(equalTo: providerSelectionTitle.bottomAnchor, constant: 16).isActive = true
    }

    open func setupSearchBar() {
        addSubview(providerSearchBar)
        providerSearchBar.topAnchor.constraint(equalTo: providerSelectionDescription.bottomAnchor, constant: 48).isActive = true
        providerSearchBar.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        providerSearchBar.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        providerSearchBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        providerSearchBar.heightAnchor.constraint(equalToConstant: 56).isActive = true

        addSubview(searchIcon)
        searchIcon.centerYAnchor.constraint(equalTo: providerSearchBar.centerYAnchor).isActive = true
        searchIcon.rightAnchor.constraint(equalTo: providerSearchBar.rightAnchor, constant: -16).isActive = true
        searchIcon.heightAnchor.constraint(equalToConstant: 17).isActive = true
        searchIcon.widthAnchor.constraint(equalTo: searchIcon.heightAnchor, multiplier: 1).isActive = true

        addSubview(providerSearchBarLabel)
        providerSearchBarLabel.leftAnchor.constraint(equalTo: providerSearchBar.leftAnchor, constant: 16).isActive = true
        providerSearchBarLabel.rightAnchor.constraint(equalTo: providerSearchBar.rightAnchor).isActive = true
        providerSearchBarLabel.topAnchor.constraint(equalTo: providerSearchBar.topAnchor).isActive = true
        providerSearchBarLabel.bottomAnchor.constraint(equalTo: providerSearchBar.bottomAnchor).isActive = true

        addSubview(searchBarMask)
        searchBarMask.leftAnchor.constraint(equalTo: providerSearchBar.safeLeftAnchor).isActive = true
        searchBarMask.rightAnchor.constraint(equalTo: providerSearchBar.safeRightAnchor).isActive = true
        searchBarMask.topAnchor.constraint(equalTo: providerSearchBar.safeTopAnchor).isActive = true
        searchBarMask.bottomAnchor.constraint(equalTo: providerSearchBar.safeBottomAnchor).isActive = true
    }

    open func setupProviderTableView() {
        addSubview(providerTableView)
        providerTableView.topAnchor.constraint(equalTo: providerSearchBar.bottomAnchor, constant: 24).isActive = true
        providerTableView.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: 16).isActive = true
        providerTableView.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -16).isActive = true
        providerTableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        providerTableView.widthAnchor.constraint(equalTo: providerSearchBar.widthAnchor).isActive = true
        providerTableView.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -16).isActive = true
    }
}

public protocol ProviderCellViewable: UITableViewCell {
    var cellView: UIView { get }
    var providerLabel: UILabel { get }
    var hasBorder: Bool { get set }
    var loadingSpinner: AnimationView { get }
}

@objc open class ProviderCell: UITableViewCell, ProviderCellViewable {
    public var hasBorder = false

    public let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var providerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderTableViewCellFont
        label.textAlignment = .left
        label.textColor = IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewProviderTableViewCellTextColor
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

        cellView.addSubview(loadingSpinner)
        loadingSpinner.topAnchor.constraint(equalTo: cellView.safeTopAnchor).isActive = true
        loadingSpinner.bottomAnchor.constraint(equalTo: cellView.safeBottomAnchor).isActive = true
        loadingSpinner.rightAnchor.constraint(equalTo: cellView.safeRightAnchor, constant: -16).isActive = true
        loadingSpinner.widthAnchor.constraint(equalToConstant: 25).isActive = true
        loadingSpinner.heightAnchor.constraint(equalToConstant: 25).isActive = true

        cellView.addSubview(providerLabel)
        providerLabel.leftAnchor.constraint(equalTo: cellView.safeLeftAnchor, constant: 16).isActive = true
        providerLabel.rightAnchor.constraint(equalTo: cellView.safeRightAnchor, constant: -(frame.width * 0.3)).isActive = true
        providerLabel.topAnchor.constraint(equalTo: cellView.safeTopAnchor).isActive = true
        providerLabel.bottomAnchor.constraint(equalTo: cellView.safeBottomAnchor).isActive = true
        providerLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
    }
}
