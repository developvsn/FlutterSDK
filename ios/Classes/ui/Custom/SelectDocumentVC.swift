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
import idenfycore
import iDenfySDK

class SelectDocumentVC: UIViewController {
    
    public var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.clipsToBounds = true
        button.setImage("back".image, for: .normal)
        return button
    }()
    
    public var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Select a document"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    public var subLabel: UILabel = {
        let label = UILabel()
        label.textColor = "494949".hexColor
        label.text = "Select the type of document you want to identify"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.rowHeight = 65
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        return table
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = "#161617".hexColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    var documentsArray = [CustomDocumentType(image: "idcard", title: "Identity Card", documentCode: ["ID_CARD"]),
                          CustomDocumentType(image: "passport", title: "Passport", documentCode: ["PASSPORT"]),
                          CustomDocumentType(image: "residence", title: "Residence Permit",documentCode: ["RESIDENCE_PERMIT"]),
                          CustomDocumentType(image: "driver", title: "Driver's License", documentCode : ["DRIVER_LICENSE"])]
    
    var selectedIndex = -1
    var targetDocumentType = [String]()
    var targetDocumentName = String()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        setup()
    }
    
    private func setup() {
        configureLayout()
        setupTableView()
    }
    
    private func configureLayout() {
        view.addSubview(backButton)
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(tableView)
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
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(subLabel.snp.bottom).offset(50.resized())
            make.height.equalTo(250)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-27)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        
        continueButton.rx.tap.bind { _ in
            Singleton.shared.usersDocument = self.targetDocumentType
            Singleton.shared.uiDocument = self.targetDocumentName
           let confirmVC = ConfirmDocumentTypeVC()
          //  let succesVer = SuccesVerificationVC()
         //   let failedVC = FailedVerificationVC()
         //   let selectVC = SelectCountryVC()
            
//            let token = UserDefaults.standard.value(forKey: "token") as! String
//
//                        let idenfySettingsV2 = IdenfyBuilderV2()
//                            .withAuthToken(token)
//                            .build()
//
//            idenfyController.initializeIdenfySDKV2WithManual(idenfySettingsV2: idenfySettingsV2)
//            let idenfyVC = idenfyController.instantiateNavigationController()
//            self.present(idenfyVC, animated: true, completion: nil)
            
            self.navigationController?.pushViewController(confirmVC, animated: true)
        }.disposed(by: disposeBag)
        
        backButton.rx.tap.bind { _ in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        
    }
    
    private func setupTableView() {
        tableView.register(CustomDocumentCell.self, forCellReuseIdentifier: "CustomDocumentCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SelectDocumentVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        targetDocumentType = documentsArray[indexPath.row].documentCode
        targetDocumentName = documentsArray[indexPath.row].title
        tableView.reloadData()
    }
}

extension SelectDocumentVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomDocumentCell", for: indexPath) as! CustomDocumentCell
        
        cell.customDocument = documentsArray[indexPath.row]
        
        if indexPath.row == selectedIndex {
            cell.configureSelectedLayout()
        } else {
            cell.configureDefaultLayout()
        }
        
        return cell
    }
}
