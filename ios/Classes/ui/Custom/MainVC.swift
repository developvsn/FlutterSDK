//
//  MainVC.swift
//  idenfy-sample-ios
//
//  Created by iMac 21 on 27/12/2021.
//  Copyright © 2021 Viktor Vostrikov. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Lottie

class MainVC: UIViewController {
    
    
    
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = "#161617".hexColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    

    
    
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        setup()
    }
    
    private func setup() {
        configureLayout()
    }
    
    private func configureLayout() {
       
        view.addSubview(continueButton)
       
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(100)
        }
        
        
        continueButton.rx.tap.bind { _ in
          //  let confirmVC = ConfirmDocumentTypeVC()
          //  let succesVer = SuccesVerificationVC()
         //   let failedVC = FailedVerificationVC()
            let selectVC = SelectCountryVC()
            self.navigationController?.pushViewController(selectVC, animated: true)
        }.disposed(by: disposeBag)
    }
    
    
}

