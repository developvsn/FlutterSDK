//
//  DrawerContentViewV2Custom.swift
//  idenfy-sample-ios
//
//  Created by iMac 21 on 24/12/2021.
//  Copyright © 2021 Viktor Vostrikov. All rights reserved.
//

import Foundation



import Foundation
import iDenfySDK
import idenfyviews
import UIKit
import idenfycore

@objc open class DrawerContentViewV2Custom: UIView, DrawerContentViewableV2 {
    public var bottomControls: UIStackView!
    
    
    public var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.layer.cornerRadius = 20
        scroll.clipsToBounds = true
        scroll.bounces = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    public var delegate: CameraSessionDrawerDelegate?
    
    public var toolbar: IdenfyToolbarV2CameraSession = {
        let toolbar = IdenfyToolbarV2CameraSession(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.backButton.setImage("back".image, for: UIControl.State.normal)
        return toolbar
    }()
    
    public var descriptionLabelV2: UILabel = {
        let label = UILabel()
        label.textColor = IdenfyDrawerUISettingsV2.idenfyDrawerDescriptionTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = IdenfyDrawerUISettingsV2.idenfyDrawerDescriptionFont
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    public var drawerView: UIView = {
        let drawerView = UIView()
        drawerView.translatesAutoresizingMaskIntoConstraints = false
        return drawerView
    }()

  

    public var titleText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    public var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    public var descriptionText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    public var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor(red: 139 / 255, green: 199 / 255, blue: 224 / 255, alpha: 1)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()

    public var expandButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.clipsToBounds = true
        return button
    }()

    public var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_instructions_ic_viewpager_next), for: .normal)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.heightAnchor.constraint(lessThanOrEqualToConstant: 24).isActive = true
        button.widthAnchor.constraint(lessThanOrEqualToConstant: 60).isActive = true
        return button
    }()

    public var prevButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        button.setImage(IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_instructions_ic_viewpager_previous), for: .normal)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return button
    }()

    public var backTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .white
        text.font = UIFont.boldSystemFont(ofSize: 16)
        return text
    }()

    public var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_instructions_ic_back)
        return imageView
    }()
    
    public var faceDetectionAlertImage: UIImageView = {
        let uiImage = UIImageView()
        
        return uiImage
    }()
    
    public func setupSlideScrollViewV2(slides: [InstructionVideo]?, scrollWidth: CGFloat?) {
        print("test")
    }
    
    public func handleExpandedView(_ cameraSessionInstructions: IdenfyInstructionsEnum) {
        print("test")
    }
    
    public func handleCollapsedView(_ cameraSessionInstructions: IdenfyInstructionsEnum) {
        print("test")
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


   
    open func setupConstraints() {
        backgroundColor = IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewBackgroundColor
        setupToolbar()
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

}
