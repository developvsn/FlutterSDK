//
//  SelectCountryVC.swift
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


extension Locale {
    func countryCode(by countryName: String) -> String? {
        return Locale.isoRegionCodes.first(where: { code -> Bool in
            guard let localizedCountryName = localizedString(forRegionCode: code) else {
                return false
            }
            return localizedCountryName.lowercased() == countryName.lowercased()
        })
    }
}

//let countryArray = NSLocale.isoCountryCodes.map
//{
//        (code:String) -> String in
//
//        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
//        let currentLocaleID = NSLocale.current.identifier
//        return NSLocale(localeIdentifier: currentLocaleID).displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
//}

var countryArray = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United States","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];

var tempArray = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United States","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];

var x = 500

class SelectCountryVC: UIViewController {
    
    
    
    
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
        label.text = "Select issuing country"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    public lazy var textEdit : UITextField = {
       let textEditElement = UITextField()
        textEditElement.textColor = "#161617".hexColor
        textEditElement.font = .systemFont(ofSize: 14, weight: .regular)
        textEditElement.translatesAutoresizingMaskIntoConstraints = false
        textEditElement.adjustsFontSizeToFitWidth = true
        textEditElement.delegate = self
        textEditElement.returnKeyType = .done
        return textEditElement
    }()
    
    public var findInputDesctiption: UILabel = {
        let label = UILabel()
        label.textColor = "#ADAEAF".hexColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Document’s country"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    
    public var subLabel: UILabel = {
        let label = UILabel()
        label.textColor = "494949".hexColor
        label.text = "Choose the country where your document was issued"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    public var textEditDivider : UIImageView = {
       let image = UIImageView()
        image.image = "textEditDivider".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 52.resized()
        table.separatorColor = "#F6F6F9".hexColor
        table.showsVerticalScrollIndicator = true
        table.isScrollEnabled = true
        table.layer.borderColor = "#E8EAF0".hexColor.cgColor
        table.layer.borderWidth = 1
        table.layer.cornerRadius = 6
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        

    }
    
    private func setup() {
        configureLayout()
        configureTableLayout()
        textEdit.addTarget(self, action: #selector(SelectCountryVC.textFieldDidChange(_:)), for: .editingChanged)
        setupTableView()
    }
    
    var disposeBag = DisposeBag()
    
    private func configureLayout() {
        view.addSubview(backButton)
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(findInputDesctiption)
        view.addSubview(textEdit)
        view.addSubview(textEditDivider)
        hideKeyboardWhenTappedAround()
        
        
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
            make.width.equalTo(313.resized(.width))
        }
        
    
        findInputDesctiption.snp.makeConstraints { make in
            make.top.equalTo(subLabel.snp.bottom).offset(40.resized())
            make.leading.equalToSuperview().offset(22)
        }
        
        textEdit.snp.makeConstraints { make in
            make.top.equalTo(findInputDesctiption.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(22)
            make.height.equalTo(20)
            make.width.equalTo(335)
        }
        
        textEditDivider.snp.makeConstraints { make in
            make.top.equalTo(textEdit.snp.bottom)
            make.leading.equalToSuperview().offset(22)
            make.width.equalTo(335)
            make.height.equalTo(1)
        }
        
        
        backButton.rx.tap.bind { _ in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
    }
    
    private func configureTableLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(textEditDivider.snp.bottom).offset(10.resized())
            make.height.equalTo(275)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        var test : [String] = [];
        for x in countryArray {
            if(x.lowercased().starts(with: textField.text?.lowercased() ?? "0")){
                test.append(x)
            }
        }
        var x = 0;
        tempArray = test
        
        if tempArray.count < 5 {
            x = tempArray.count * 55
        } else {
            x = 275
        }
        
        tableView.snp.updateConstraints { make in
            make.height.equalTo(x.resized())
        }
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.register(CustomCountryCell.self, forCellReuseIdentifier: "CustomCountryCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
}

extension SelectCountryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let locale = Locale(identifier: "en_US")
      //  let countryCode = locale.countryCode(by: "Russia")
        textEdit.text = tempArray[indexPath.row]
      //  print(locale.countryCode(by: tempArray[indexPath.row])?.lowercased())
        Singleton.shared.usersCountry = locale.countryCode(by: tempArray[indexPath.row])?.lowercased()
        let selectDocument = SelectDocumentVC()
        self.navigationController?.pushViewController(selectDocument, animated: true)
    }
}

extension SelectCountryVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCountryCell", for: indexPath) as! CustomCountryCell
        
        cell.countryName = tempArray[indexPath.row]
    
        return cell
    }

}

extension SelectCountryVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
