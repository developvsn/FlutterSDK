//
//  SplashScreenV2.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 2019-12-04.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import Lottie
import UIKit
import SnapKit

@objc open class SplashScreenV2View: UIView, SplashScreenV2Viewable {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var idenfyLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_splash_screen_logo)
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()

    public var backgroundGradient: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage(ConstsIdenfyImages.idenfy_ic_gradient_splash_screen_background)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    var loadingSpinner: AnimationView = {
        let lottieView = AnimationView.init(name: "ronary_animation")
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.contentMode = .scaleAspectFit
        lottieView.play()
        lottieView.loopMode = .loop
        lottieView.isHidden = true
        return lottieView
    }()
    
    var lottieAnim: AnimationView = {
        let lottieView = AnimationView.init(name: "ronary_animation")
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        lottieView.contentMode = .scaleAspectFit
        lottieView.play()
        lottieView.loopMode = .loop
        return lottieView
    }()

    public var splashScreenTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = IdenfySplashScreenViewUISettingsV2.idenfySplashScreenViewDescriptionTextColor
        label.numberOfLines = 0
        label.font = IdenfySplashScreenViewUISettingsV2.idenfySplashScreenViewDescriptionFont
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    open func setupConstraints() {
        setupViews()
    }

    @objc open func setupViews() {
        addSubview(backgroundGradient)
        backgroundGradient.leftAnchor.constraint(equalTo: safeLeftAnchor, constant: -5).isActive = true
        backgroundGradient.rightAnchor.constraint(equalTo: safeRightAnchor, constant: 5).isActive = true
        addSubview(idenfyLogo)
        let spinnerSize = bounds.height / 1.62
        let titleY = bounds.height / 5
        idenfyLogo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        idenfyLogo.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        idenfyLogo.heightAnchor.constraint(equalToConstant: 32).isActive = true
        addSubview(splashScreenTitle)
        splashScreenTitle.topAnchor.constraint(equalTo: idenfyLogo.bottomAnchor, constant: titleY).isActive = true
        splashScreenTitle.widthAnchor.constraint(equalToConstant: frame.width * 0.8).isActive = true
        splashScreenTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addSubview(loadingSpinner)
        loadingSpinner.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        loadingSpinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingSpinner.widthAnchor.constraint(equalToConstant: spinnerSize).isActive = true
        loadingSpinner.heightAnchor.constraint(equalToConstant: spinnerSize).isActive = true
        
        addSubview(lottieAnim)
        
        lottieAnim.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(36)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
