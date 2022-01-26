//
//  SuccesVerificationVC.swift
//  idenfy-sample-ios
//
//  Created by iMac 21 on 27/12/2021.
//  Copyright © 2021 Viktor Vostrikov. All rights reserved.
//


import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift



class SuccesVerificationVC: UIViewController {
    
    
    
    
    public var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.clipsToBounds = true
        button.setImage(UIImage(), for: .normal)
        button.isHidden = true
        return button
    }()
    
    public var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Identity Check"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    public var subLabel: UILabel = {
        let label = UILabel()
        label.textColor = "494949".hexColor
        label.text = "Verify your identity"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    public var statusImage: UIImageView = {
       let image = UIImageView()
        image.image = "succes".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    public var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = "#161617".hexColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Congrats, your\n identity was verified!"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    public var statusDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = "20303C".hexColor
        label.text = "Please verify your KBA"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = "#161617".hexColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.setTitle("Join Session", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setup() {
        configureLayout()
    }
    
    var disposeBag = DisposeBag()
    
    private func configureLayout() {
        view.addSubview(backButton)
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(statusImage)
        view.addSubview(statusLabel)
        view.addSubview(statusDescriptionLabel)
        view.addSubview(continueButton)
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72.resized())
            make.leading.equalToSuperview().offset(12)
            make.size.equalTo(24)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(67.resized())
            make.leading.equalTo(backButton.snp.trailing).offset(2)
            make.height.equalTo(34)
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.leading.equalTo(mainLabel.snp.leading)
            make.height.equalTo(17)
            make.width.equalTo(270)
        }
        
        statusImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(120)
            make.top.equalTo(subLabel.snp.bottom).offset(133.resized())
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(statusImage.snp.bottom).offset(78.resized())
            make.height.equalTo(66.resized())
        }
        
        statusDescriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(18.resized())
            make.top.equalTo(statusLabel.snp.bottom).offset(30)
        }
        
     
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-27)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        
//        continueButton.rx.tap.bind { _ in
////
////            let confirmVC = ConfirmDocumentTypeVC()
////            self.navigationController?.pushViewController(confirmVC, animated: true)
//        }.disposed(by: disposeBag)
    }
    


}
