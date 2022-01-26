//
//  CustomDrawer.swift
//  idenfy-sample-ios
//
//  Created by iMac 21 on 24/12/2021.
//  Copyright © 2021 Viktor Vostrikov. All rights reserved.
//

import Foundation

import AVFoundation
import Foundation
import idenfycore
import idenfyviews
import UIKit
import SnapKit
@objc open class CustomDrawer: UIView, DrawerContentViewableV2 {
    public var faceDetectionAlertImage: UIImageView = {
        let uiImage = UIImageView()
        
        return uiImage
    }()
    
    public var bottomControls: UIStackView!
    public var backButton: UIStackView?

    open weak var delegate: CameraSessionDrawerDelegate?

    public var toolbar: IdenfyToolbarV2CameraSession = {
        let toolbar = IdenfyToolbarV2CameraSession(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    public var descriptionLabelV2: UILabel = {
        let label = UILabel()
        label.textColor = "#CDCDCD".hexColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = IdenfyDrawerUISettingsV2.idenfyDrawerDescriptionFont
        label.numberOfLines = 2
        return label
    }()

    public var drawerView: UIView = {
        let drawerView = UIView()
        drawerView.translatesAutoresizingMaskIntoConstraints = false
        return drawerView
    }()

    public var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.layer.cornerRadius = 20
        scroll.clipsToBounds = true
        scroll.bounces = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
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

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupButtonActions()
    }

    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setupSlideScrollViewV2(slides: [InstructionVideo]?, scrollWidth: CGFloat?) {
        setupDrawerUI()

        addSubview(drawerView)

        drawerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        drawerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        drawerView.topAnchor.constraint(equalTo: safeTopAnchor).isActive = true
        drawerView.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true

        drawerView.addSubview(expandButton)
        expandButton.centerXAnchor.constraint(equalTo: drawerView.centerXAnchor).isActive = true
        expandButton.heightAnchor.constraint(equalToConstant: 8).isActive = true
        expandButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -8).isActive = true

        drawerView.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: drawerView.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: drawerView.centerYAnchor, constant: -20).isActive = true
        scrollView.widthAnchor.constraint(equalTo: drawerView.widthAnchor, multiplier: 0.8).isActive = true
        scrollView.heightAnchor.constraint(equalTo: drawerView.widthAnchor, multiplier: 0.8).isActive = true

        if let unwrappedSlides = slides {
            if let unwrappedWidth = scrollWidth {
                scrollView.contentSize = CGSize(width: unwrappedWidth * CGFloat(unwrappedSlides.count), height: unwrappedWidth)
                scrollView.isPagingEnabled = true
            }
        }

        drawerView.addSubview(titleText)
        titleText.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -10).isActive = true
        titleText.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        titleText.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        titleText.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        bottomControls = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        drawerView.addSubview(bottomControls!)
        bottomControls?.translatesAutoresizingMaskIntoConstraints = false
        bottomControls?.distribution = .equalSpacing
        bottomControls?.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 15).isActive = true
        bottomControls?.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        bottomControls?.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true

        drawerView.addSubview(descriptionText)
        descriptionText.bottomAnchor.constraint(equalTo: expandButton.topAnchor).isActive = true
        descriptionText.topAnchor.constraint(equalTo: bottomControls!.bottomAnchor).isActive = true
        descriptionText.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        descriptionText.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        backButton = UIStackView(arrangedSubviews: [backImageView, backTextView])
        drawerView.addSubview(backButton!)
        backButton?.translatesAutoresizingMaskIntoConstraints = false
        backButton?.distribution = .fillProportionally
        backButton?.bottomAnchor.constraint(equalTo: drawerView.bottomAnchor, constant: -85).isActive = true
        backButton?.leadingAnchor.constraint(equalTo: drawerView.leadingAnchor, constant: 20).isActive = true
        backButton?.isUserInteractionEnabled = true
       

        
        drawerView.addSubview(toolbar)
        toolbar.leftAnchor.constraint(equalTo: drawerView.leftAnchor).isActive = true
        toolbar.rightAnchor.constraint(equalTo: drawerView.rightAnchor).isActive = true

        let heightOfToolbar: CGFloat = 60
        var bottomAnchorConstant: CGFloat = 60
        if UIDevice.isIphone5OrBelow {
            bottomAnchorConstant = 80
        }

        toolbar.bottomAnchor.constraint(equalTo: drawerView.bottomAnchor, constant: -ConstsIdenfyUI.IDENFY_TOP_DRAWER_INSTRUCTIONS_HEIGHT + bottomAnchorConstant).isActive = true
        toolbar.heightAnchor.constraint(equalToConstant: heightOfToolbar).isActive = true

        var titleTopAnchorConst: CGFloat = -16
        if UIDevice.isIphone5OrBelow {
            titleTopAnchorConst = -19
        }

        var desriptionTopAnchorConst: CGFloat = 12
        if UIDevice.isIphone5OrBelow {
            desriptionTopAnchorConst = 3
        }

        

       

        toolbar.backButton.imageView?.setImageColor(.white)

        if let device = AVCaptureDevice.default(for: AVMediaType.video) {
            if device.hasTorch {
                toolbar.idenfyToggleFlashButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
                toolbar.idenfyToggleFlashButton.setNeedsLayout()
                toolbar.idenfyToggleFlashButton.isHidden = false
            } else {
                toolbar.idenfyToggleFlashButton.widthAnchor.constraint(equalToConstant: 0).isActive = true
                toolbar.idenfyToggleFlashButton.setNeedsLayout()
                toolbar.idenfyToggleFlashButton.isHidden = true
            }
        }
        drawerView.addSubview(toolbar)
        drawerView.addSubview(infoLabel)
        infoLabel.topAnchor.constraint(equalTo: drawerView.bottomAnchor, constant: -132).isActive = true
        infoLabel.leftAnchor.constraint(equalTo: drawerView.safeLeftAnchor, constant: 38).isActive = true
        
        drawerView.addSubview(descriptionLabelV2)
        descriptionLabelV2.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor, constant: 0).isActive = true
        descriptionLabelV2.trailingAnchor.constraint(equalTo: drawerView.trailingAnchor, constant: -50).isActive = true
        descriptionLabelV2.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 0).isActive = true
        
        backButton?.removeFromSuperview()
    }

    private func setupDrawerUI() {
        infoLabel.numberOfLines = 0
        infoLabel.font = IdenfyDrawerUISettingsV2.idenfyDrawerTitleFont
        infoLabel.textAlignment = .left

        titleText.font = IdenfyDrawerUISettingsV2.idenfyDrawerCurrentInstructionTitleFont
        descriptionText.font = IdenfyDrawerUISettingsV2.idenfyDrawerCurrentInstructionDescriptionFont

        expandButton.tintColor = IdenfyDrawerUISettingsV2.idenfyDrawerExpandButtonTintColor
        infoLabel.textColor = IdenfyDrawerUISettingsV2.idenfyDrawerTitleTextColor
        titleText.textColor = IdenfyDrawerUISettingsV2.idenfyDrawerCurrentInstructionTitleTextColor
        descriptionText.textColor = IdenfyDrawerUISettingsV2.idenfyDrawerCurrentInstructionDescriptionTextColor
        pageControl.pageIndicatorTintColor = IdenfyDrawerUISettingsV2.idenfyDrawerInstructionControlsTintColor
        pageControl.currentPageIndicatorTintColor = IdenfyDrawerUISettingsV2.idenfyDrawerCurrentInstructionIndicatorColor
        nextButton.tintColor = IdenfyDrawerUISettingsV2.idenfyDrawerNextInstructionButtonColor
        prevButton.tintColor = IdenfyDrawerUISettingsV2.idenfyDrawerPreviousInstructionButtonColor
    }

    private func setupButtonActions() {
        expandButton.addTarget(self, action: #selector(expandeOrCollapseDrawerPressed), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(previousInstructionButtonPressed), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextInstructionButtonPressed), for: .touchUpInside)
        drawerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        toolbar.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        toolbar.idenfyToggleFlashButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleFlashButtonPressed)))
        toolbar.instructionDialogButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(instructionDialogButtonPressed)))
    }

    @objc func handleTap() {
        delegate?.collapseDrawerAction()
    }

    @objc func backButtonPressed() {
        delegate?.backButtonPressedAction()
    }

    @objc func toggleFlashButtonPressed() {
        delegate?.toggleFlashButtonPressedAction()
    }

    @objc func instructionDialogButtonPressed() {
        delegate?.instructionDialogButtonPressedAction()
    }

    @objc func expandeOrCollapseDrawerPressed() {
        delegate?.expandDrawerAction()
    }

    @objc func nextInstructionButtonPressed() {
        delegate?.nextInstructionButtonPressedAction()
    }

    @objc func previousInstructionButtonPressed() {
        delegate?.previousInstructionButtonPressedAction()
    }

    open func handleCollapsedView(_ cameraSessionInstructions: IdenfyInstructionsEnum) {
        backButton?.isHidden = false
        bottomControls?.isHidden = true
        descriptionText.isHidden = true
        infoLabel.isHidden = false

        toolbar.isHidden = false
        descriptionLabelV2.isHidden = false

        if UIDevice.current.hasNotch {
            for constraint in drawerView.constraints {
                if constraint.identifier == "expandButton" {
                    constraint.constant = 0
                }
            }
        }
        if cameraSessionInstructions == .drawer {
            expandButton.setImage(
                IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_instructions_ic_arrow_expand_more), for: .normal
            )
        }
    }

    open func handleExpandedView(_ cameraSessionInstructions: IdenfyInstructionsEnum) {
        backButton?.isHidden = true
        bottomControls?.isHidden = false
        descriptionText.isHidden = false
        infoLabel.isHidden = true

        toolbar.isHidden = true
        descriptionLabelV2.isHidden = true

        if UIDevice.current.hasNotch {
            for constraint in drawerView.constraints {
                if constraint.identifier == "expandButton" {
                    constraint.constant = -20
                }
            }
        }

        if cameraSessionInstructions == .drawer {
            expandButton.setImage(
                IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_instructions_ic_arrow_expand_less), for: .normal
            )
        }
    }
}
