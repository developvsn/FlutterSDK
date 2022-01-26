//
//  DocumentCameraView.swift
//  iDenfySDK
//
//  Created by Viktas Juskys on 14/08/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import iDenfySDK
import idenfyviews
import UIKit
import idenfycore

extension String {
    var image: UIImage? {
      return UIImage(named: self)
    }
    
    var hexColor: UIColor {
      var cString: String = trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
      if ((cString.count) != 6) { return UIColor.gray }
      var rgbValue: UInt32 = 0
      Scanner(string: cString).scanHexInt32(&rgbValue)
      return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
      )
    }
}

@objc open class DocumentCameraViewV2: UIView, DocumentCameraViewableV2 {
    
    

    
    
   
    
    public var delegate: CameraSessionDrawerDelegate?
    
   
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        IdenfyButtonsUISettingsV2.idenfyGradientButtonColorStart = .black
        IdenfyButtonsUISettingsV2.idenfyGradientButtonColorEnd = .black
        IdenfyDrawerUISettingsV2.idenfyDrawerCurrentInstructionIndicatorColor = "#FFC700".hexColor
        IdenfyCommonColors.idenfyMainColorV2 = "#FFC700".hexColor
        setupConstraints()
    }

    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    public required convenience init?(coder _: NSCoder) {
        self.init(frame: CGRect.zero)
    }

    
//    public var toolbar: IdenfyToolbarV2CameraSession = {
//        let toolbar = IdenfyToolbarV2CameraSession(frame: .zero)
//        toolbar.translatesAutoresizingMaskIntoConstraints = false
//        toolbar.backButton = UIButton()
//        return toolbar
//    }()
    
    public lazy var cameraView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isOpaque = true
        view.backgroundColor = IdenfyDocumentCameraSessionUISettingsV2.idenfyDocumentCameraPreviewSessionBackgroundColor
        return view
    }()

    public var photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        return imageView
    }()

    public var rectangleView: IdenfyRectangleViewV2 = {
        let view = IdenfyRectangleViewV2(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.imageAssetName = "Frame"
        view.tintColor = "#FFC700".hexColor
        view.isOpaque = true
        return view
    }()

    public var cameraSessionsButtons: CameraSessionsButtonsViewableV2 = {
        let view = CameraSessionsButtonsViewV2(frame: .zero)
        view.idenfyMakePhotoBackground.tintColor = .white
        view.idenfyMakePhotoBackground.image = nil
        view.translatesAutoresizingMaskIntoConstraints = false
        view.takePhotoButton.setImage("camera_icon".image, for: .normal)
//        view.takePhotoButton.setImageWithTint(tintColor: "161617".hexColor, uiImage: "camera_icon".image!, uiState: .normal)
//        view.takePhotoButton.setImageWithTint(tintColor: "161617".hexColor, uiImage: "camera_icon".image!, uiState: .selected)
//        view.takePhotoButton.setImageWithTint(tintColor: "161617".hexColor, uiImage: "camera_icon".image!, uiState: .focused)
//        view.takePhotoButton.setImageWithTint(tintColor: "161617".hexColor, uiImage: "camera_icon".image!, uiState: .highlighted)
//        view.takePhotoButton.setImageWithTint(tintColor: "161617".hexColor, uiImage: "camera_icon".image!, uiState: .application)
//        view.takePhotoButton.setImageWithTint(tintColor: "161617".hexColor, uiImage: "camera_icon".image!, uiState: .reserved)
        view.isOpaque = true
        return view
    }()
    
    public var toolbar: IdenfyToolbarV2CameraSession = {
        let toolbar = IdenfyToolbarV2CameraSession(frame: .zero)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.backButton.setImage("back".image, for: .normal)
        toolbar.idenfyToggleFlashButton.image = "back".image
        return toolbar
    }()

    @objc private func setupConstraints() {
        setupToolbar()
        setupCameraView()
        setupPhotoView()
        setupRectangleView()
        setupCameraSessionsButtons()
    }

    func setupCameraSessionsButtons() {
        addSubview(cameraSessionsButtons)
        cameraSessionsButtons.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cameraSessionsButtons.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cameraSessionsButtons.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cameraSessionsButtons.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
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

    func setupCameraView() {
        addSubview(cameraView)
        cameraView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cameraView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cameraView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cameraView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func setupPhotoView() {
        cameraView.addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: cameraView.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: cameraView.bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: cameraView.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: cameraView.trailingAnchor).isActive = true
    }

    func setupRectangleView() {
        cameraView.addSubview(rectangleView)
        rectangleView.topAnchor.constraint(equalTo: cameraView.topAnchor).isActive = true
        rectangleView.bottomAnchor.constraint(equalTo: cameraView.bottomAnchor).isActive = true
        rectangleView.leadingAnchor.constraint(equalTo: cameraView.leadingAnchor).isActive = true
        rectangleView.trailingAnchor.constraint(equalTo: cameraView.trailingAnchor).isActive = true
    }
}
