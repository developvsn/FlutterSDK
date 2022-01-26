//
//  CustomDocumentCell.swift
//  idenfy-sample-ios
//
//  Created by iMac 21 on 27/12/2021.
//  Copyright © 2021 Viktor Vostrikov. All rights reserved.
//

import UIKit
import SnapKit

class CustomDocumentCell: UITableViewCell {

    private lazy var fullView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
       return view
    }()
    
    public lazy var typeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
       return imageView
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = "161617".hexColor
       return label
    }()
    
    public lazy var checkmarkImageView: UIImageView = {
        let imageView = UIImageView(image: "selected".image)
        imageView.contentMode = .scaleAspectFill
       return imageView
    }()
    
    var customDocument: CustomDocumentType? {
        didSet { configureDocument() }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureDefaultLayout() {
        
        addSubview(fullView)
        fullView.addSubview(typeImageView)
        fullView.addSubview(typeLabel)
        fullView.addSubview(checkmarkImageView)
        
        fullView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(55)
        }
        
        typeImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(29)
            make.centerY.equalToSuperview()
            make.size.equalTo(25)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(typeImageView.snp.trailing).offset(15)
        }
        
        checkmarkImageView.snp.makeConstraints { make in
            make.size.equalTo(34)
            make.trailing.equalToSuperview().offset(-17)
            make.centerY.equalToSuperview()
        }
        
        fullView.layer.cornerRadius = 4
        fullView.layer.borderWidth = 1
        fullView.layer.borderColor = "EDEDED".hexColor.cgColor//UIColor.black.cgColor
        checkmarkImageView.isHidden = true
    }
    
    public func configureSelectedLayout() {
        
        addSubview(fullView)
        fullView.addSubview(typeImageView)
        fullView.addSubview(typeLabel)
        fullView.addSubview(checkmarkImageView)
        
        fullView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(55)
        }
        
        typeImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(29)
            make.centerY.equalToSuperview()
            make.size.equalTo(25)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(typeImageView.snp.trailing).offset(15)
        }
        
        checkmarkImageView.snp.makeConstraints { make in
            make.size.equalTo(34)
            make.trailing.equalToSuperview().offset(-17)
            make.centerY.equalToSuperview()
        }
        
        fullView.layer.cornerRadius = 2
        fullView.layer.borderWidth = 1.5
        fullView.layer.borderColor = UIColor.black.cgColor
        checkmarkImageView.isHidden = false
    }
    
    private func configureDocument() {
        guard let customDocument = customDocument else { return }
        typeImageView.image = customDocument.image.image
        typeLabel.text = customDocument.title
    }
}
