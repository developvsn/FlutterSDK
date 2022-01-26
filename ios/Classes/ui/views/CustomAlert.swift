//
//  CustomAlert.swift
//  idenfy-sample-ios
//
//  Created by Viktor Vostrikov on 2020-06-22.
//  Copyright © 2020 Viktor Vostrikov. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import Lottie
import UIKit

public class CustomAlert: UIView, Modal {
    public var backgroundView = UIView()
    public var dialogView = UIView()
    private var canCancel: Bool = false

    public var alertTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
//        label.font = UIFont(name: ConstsIdenfyFonts.idenfyFontBoldV2, size: 24)
        label.font = IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewTitleFont
        label.textAlignment = .center
        label.textColor = IdenfyCommonColors.idenfySecondColorV2
        return label
    }()

    public var loadingImage: AnimationView = {
        let lottieView = AnimationView(frame: .zero)
        lottieView.translatesAutoresizingMaskIntoConstraints = false
      //  let path = Bundle.main.path(forResource: "ronary_animation", ofType: "json")
      //  lottieView.animation = Animation.filepath(path!)
        lottieView.contentMode = .scaleAspectFit
        lottieView.play()
        return lottieView
    }()

    var alertImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        imageView.image = IdenfyViewUtils.getImage("idenfy_ic_results_view_step_spinner_status_error_v2")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public convenience init(title: String, canCancel: Bool) {
        self.init(frame: UIScreen.main.bounds)
        self.canCancel = canCancel
        initialize(title: title)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(title: String) {
        alertTitle.text = title
    }

    func initialize(title: String) {
        dialogView.clipsToBounds = true

        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)

        dialogView.addSubview(alertTitle)
        alertTitle.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
        alertTitle.topAnchor.constraint(equalTo: dialogView.safeTopAnchor, constant: 32).isActive = true
        alertTitle.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor, constant: -8).isActive = true
        alertTitle.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 8).isActive = true

        if canCancel {
            dialogView.addSubview(alertImage)
            alertImage.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
            alertImage.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: 16).isActive = true
        } else {
            dialogView.addSubview(loadingImage)
            loadingImage.snp.makeConstraints { make in
                make.center.equalTo(dialogView.snp.center)
                make.width.equalTo(56)
                make.height.equalTo(50)
            }
//            loadingImage.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
////            loadingImage.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: 16).isActive = true
//            loadingImage.centerYAnchor.constraint(equalTo: dialogView.centerYAnchor).isActive = true
//            loadingImage.frame.size.width = 56
//            loadingImage.frame.size.height = 50
        }

        dialogView.frame.origin = CGPoint(x: 32, y: frame.height)
        dialogView.frame.size = CGSize(width: frame.width - 64, height: 200)
        dialogView.backgroundColor = UIColor.white
        addSubview(dialogView)
    }

    @objc func didTappedOnBackgroundView() {
        if canCancel {
            dismiss(animated: false)
        }
    }
}
