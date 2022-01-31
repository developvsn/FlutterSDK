//
//  ConfirmDocumentTypeVC.swift
//  idenfy-sample-ios
//
//  Created by iMac 21 on 27/12/2021.
//  Copyright © 2021 Viktor Vostrikov. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import iDenfySDK
import idenfyviews
import UIKit
import idenfycore
import IdenfyLiveness
import FaceTecSDK

class ConfirmDocumentTypeVC: UIViewController {
    
    lazy var getIdenfyAuthTokenUseCase = GetIdenfyAuthTokenUseCase(apiHelper: APIHelper())
    private let errorAlert = CustomAlert(title: NSLocalizedString("idenfy_sample_app_loading_view_title", tableName: nil, bundle: Bundle.main, value: "", comment: ""), canCancel: true)

    private let loadingAlert = CustomAlert(title: NSLocalizedString("idenfy_sample_app_loading_view_title", tableName: nil, bundle: Bundle.main, value: "", comment: ""), canCancel: false)
    var appLanguage = AppLanguage("en")
  
    
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
        label.text = "Confirm document type"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    public var subLabel: UILabel = {
        let label = UILabel()
        label.textColor = "494949".hexColor
        label.text = "Please have your identity card ready to identify"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    public var stage1image: UIImageView = {
        let image = UIImageView()
        image.image = "stage1".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var stage2image: UIImageView = {
        let image = UIImageView()
        image.image = "stage2".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var stage3image: UIImageView = {
        let image = UIImageView()
        image.image = "stage3".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var verticalDivider1: UIImageView = {
        let image = UIImageView()
        image.image = "verticalDivider".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var verticalDivider2: UIImageView = {
        let image = UIImageView()
        image.image = "verticalDivider".image
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public var stage1label: UILabel = {
        let label = UILabel()
        label.textColor = "161617".hexColor
        label.text = "Document front photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    
    public var stage2label: UILabel = {
        let label = UILabel()
        label.textColor = "161617".hexColor
        label.text = "Document back photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    public var stage3label: UILabel = {
        let label = UILabel()
        label.textColor = "161617".hexColor
        label.text = "Face photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    
    public var instructionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = "161617".hexColor
        label.text = "Identification will take\n 3 steps:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    public lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = "#F5F6F9".hexColor
        return view
    }()
    
    public lazy var beginIdentificationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = "#161617".hexColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.setTitle("Begin Identification", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
//        print(Singleton.shared.usersDocument)
//        print(Singleton.shared.usersCountry)
        
        stage1label.text = "Front of " + Singleton.shared.uiDocument!.lowercased()
        stage2label.text = "Back of " + Singleton.shared.uiDocument!.lowercased()
        
        beginIdentificationButton.addTarget(self, action: #selector(beginIdentificationPressed), for: .touchUpInside)
        
    }
    
    private func setup() {
        configureLayout()
    }
    
    var disposeBag = DisposeBag()
    
    private func configureLayout() {
        view.addSubview(backButton)
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(mainView)
        view.addSubview(beginIdentificationButton)
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(subLabel).offset(50.resized())
            make.height.equalTo(542.resized())
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
        
        
        mainView.addSubview(instructionsLabel)
        mainView.addSubview(stage1image)
        mainView.addSubview(stage1label)
        mainView.addSubview(verticalDivider1)
        mainView.addSubview(stage2image)
        mainView.addSubview(stage2label)
        mainView.addSubview(verticalDivider2)
        mainView.addSubview(stage3image)
        mainView.addSubview(stage3label)
        
        instructionsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65.resized())
            make.centerX.equalToSuperview()
            make.height.equalTo(50.resized())
        }
        
        stage1image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(instructionsLabel.snp.bottom).offset(40.resized())
            make.size.equalTo(36)
        }
        
        stage1label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stage1image.snp.bottom).offset(10)
            make.height.equalTo(17)
        }
        
        verticalDivider1.snp.makeConstraints { make in
            make.top.equalTo(stage1label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(1.5)
            make.height.equalTo(36.resized())
        }
        
        stage2image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(verticalDivider1.snp.bottom).offset(10)
            make.size.equalTo(36)
        }
        
        stage2label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stage2image.snp.bottom).offset(10)
            make.height.equalTo(17)
        }
        
        verticalDivider2.snp.makeConstraints { make in
            make.top.equalTo(stage2label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(1.5)
            make.height.equalTo(36.resized())
        }
        
        stage3image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(verticalDivider2.snp.bottom).offset(10)
            make.size.equalTo(36)
        }
        
        stage3label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stage3image.snp.bottom).offset(10)
            make.height.equalTo(17)
        }
        
        
        
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
        
        
        beginIdentificationButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-27)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        
        
        beginIdentificationButton.rx.tap.bind { _ in
//
//            let confirmVC = ConfirmDocumentTypeVC()
//            self.navigationController?.pushViewController(confirmVC, animated: true)
        }.disposed(by: disposeBag)
        
        backButton.rx.tap.bind { _ in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        
    }
    



    @objc private func beginIdentificationPressed() {
        getIdenfyAuthToken()
    }

    private func getIdenfyAuthToken() {
        appLanguage.languageEnum = "en"
        setIdenfyAuthTokenState(IdenfyAuthTokenState.Loading)
        let authTokenBody = AuthTokenBody(clientId: Consts.clientId, country: Singleton.shared.usersCountry ?? "us", documents: Singleton.shared.usersDocument ?? ["ID_CARD"])
        getIdenfyAuthTokenUseCase.execute(authTokenBody: authTokenBody, appLanguage: appLanguage, success: { authToken in

            self.setIdenfyAuthTokenState(IdenfyAuthTokenState.Success(authToken: authToken))
        }) { errorResponse in
            self.setIdenfyAuthTokenState(IdenfyAuthTokenState.AuthTokenCouldNotBeReceived(error: errorResponse.message))
        }
    }

    private func setIdenfyAuthTokenState(_ idenfyAuthTokenState: IdenfyAuthTokenState) {
        switch idenfyAuthTokenState {
        case .Loading:
         //   presentLoadingAlert()
            print("test")
        case .NotStarted: break

        case let .AuthTokenCouldNotBeReceived(error: error):
            print("Error receiving token: \(error)")
          //  presentErrorAlert(error)

        case let .Success(authToken: authToken):
            dismissLoadingAlert()
            switch Consts.sdkInitFlow {
            case .Default:
                initializeIdenfySDKDefault(authToken: authToken.authToken)
            case .CustomWithImplementedViews:
                initializeIdenfySDKCustom(authToken: authToken.authToken)
            }
        }
    }

    private func presentErrorAlert(_ error: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.errorAlert.alertTitle.text = error
            self.dismissLoadingAlert()
          //  self.errorAlert.show(animated: false, viewController: self)
        }
    }

    private func presentLoadingAlert() {
        loadingAlert.loadingImage.play()
      //  loadingAlert.show(animated: false, viewController: self)
    }

    private func dismissLoadingAlert() {
        loadingAlert.dismiss(animated: false)
    }

    private func initializeIdenfySDKDefault(authToken: String) {
        let idenfyUISettingsV2 = IdenfyUIBuilderV2()
            .build()

        let idenfySettingsV2 = IdenfyBuilderV2()
            .withAuthToken(authToken)
            .withUISettingsV2(idenfyUISettingsV2)
            .build()

        let idenfyController = IdenfyController.shared
        idenfyController.initializeIdenfySDKV2WithManual(idenfySettingsV2: idenfySettingsV2)
        let idenfyVC = idenfyController.instantiateNavigationController()

        present(idenfyVC, animated: true, completion: nil)
        idenfyController.handleIdenfyCallbacksWithManualResults(idenfyIdentificationResult: {
            idenfyIdentificationResult
                in
            print("autoStatus:\(idenfyIdentificationResult.autoIdentificationStatus.rawValue) ,manualStatus:\(idenfyIdentificationResult.autoIdentificationStatus.rawValue)")
            switch idenfyIdentificationResult.autoIdentificationStatus {
            case .APPROVED:
                // The user completed an identification flow and the identification status, provided by an automated platform, is APPROVED.
                break
            case .FAILED:
                // The user completed an identification flow and the identification status, provided by an automated platform, is FAILED.
                break
            case .UNVERIFIED:
                // The user did not complete an identification flow and the identification status, provided by an automated platform, is UNVERIFIED.
                break
            }

            switch idenfyIdentificationResult.manualIdentificationStatus {
            case .APPROVED:
                // The user completed an identification flow and was verified manually while waiting for the manual verification results in the iDenfy SDK. The identification status, provided by a manual review, is APPROVED.
                break
            case .FAILED:
                // The user completed an identification flow and was verified manually while waiting for the manual verification results in the iDenfy SDK. The identification status, provided by a manual review, is FAILED.
                break

            case .WAITING:
                // The user completed an identification flow and started waiting for the manual verification results in the iDenfy SDK. Then he/she decided to stop waiting and pressed a "BACK TO ACCOUNT" button. The manual identification review is still ongoing.
                break

            case .INACTIVE:
                // The user was only verified by an automated platform, not by a manual reviewer. The identification performed by the user can still be verified by the manual review if your system uses the manual verification service.
                break
            }

        })
    }

    private func initializeIdenfySDKCustom(authToken: String) {
        
        let idenfyLivenessUISettings = IdenfyLivenessUISettings()
        
        let faceTechCustom = FaceTecCustomization()
        faceTechCustom.feedbackCustomization.textColor = "#FFC700".hexColor
        faceTechCustom.frameCustomization.borderWidth = 0
        faceTechCustom.feedbackCustomization.textColor = "#FFC700".hexColor
       faceTechCustom.frameCustomization.borderWidth = 0
        faceTechCustom.resultScreenCustomization.resultAnimationSuccessBackgroundImage = "logo".image
        faceTechCustom.guidanceCustomization.retryScreenHeaderTextColor = "#161617".hexColor
        faceTechCustom.guidanceCustomization.retryScreenImageBorderColor = UIColor(white: 1, alpha: 0)
        faceTechCustom.guidanceCustomization.retryScreenSubtextTextColor = "#161617".hexColor
        faceTechCustom.guidanceCustomization.buttonBackgroundDisabledColor = "#161617".hexColor
        faceTechCustom.guidanceCustomization.buttonBackgroundHighlightColor = "#161617".hexColor
        faceTechCustom.guidanceCustomization.buttonBackgroundNormalColor = "#161617".hexColor
        faceTechCustom.guidanceCustomization.foregroundColor = "#161617".hexColor
        faceTechCustom.feedbackCustomization.textColor = "#161617".hexColor
        faceTechCustom.guidanceCustomization.readyScreenHeaderTextColor = "#161617".hexColor
        faceTechCustom.guidanceCustomization.readyScreenSubtextTextColor = "#161617".hexColor
        faceTechCustom.cancelButtonCustomization.customImage = "close_big".image
        faceTechCustom.ovalCustomization.strokeColor =  "#FFC700".hexColor
        faceTechCustom.ovalCustomization.progressColor1 = "#FFC700".hexColor
        faceTechCustom.ovalCustomization.progressColor2 = "#FFC700".hexColor
        faceTechCustom.overlayCustomization.showBrandingImage = false
        faceTechCustom.cancelButtonCustomization.location = FaceTecCancelButtonLocation.custom
        var rect = CGRect()
        rect.origin = CGPoint(x:20,y: 50)
        rect.size = CGSize(width: 24, height: 24)
        faceTechCustom.cancelButtonCustomization.customLocation = rect
        let layer = CAGradientLayer()
        layer.colors = ["#FFC700".hexColor.cgColor,
                        "#FFC700".hexColor.cgColor,
                        "#FFC700".hexColor.cgColor,
                        "#FFC700".hexColor.cgColor]
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
        layer.locations = [0, 0.5, 0.7, 1]
        layer.shadowOffset = CGSize(width: 0 , height: 0)
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowRadius = 0.0;
        layer.shadowOpacity = 0.00;
        faceTechCustom.feedbackCustomization.shadow = nil
        faceTechCustom.feedbackCustomization.backgroundColor = layer
        faceTechCustom.feedbackCustomization.textColor = "#161617".hexColor
        faceTechCustom.resultScreenCustomization.uploadProgressFillColor = "#FFC700".hexColor
        faceTechCustom.resultScreenCustomization.uploadProgressTrackColor = "#161617".hexColor
        faceTechCustom.resultScreenCustomization.customActivityIndicatorImage = UIImage()
        faceTechCustom.resultScreenCustomization.resultAnimationBackgroundColor = .white
        faceTechCustom.resultScreenCustomization.resultAnimationForegroundColor = .white
        faceTechCustom.resultScreenCustomization.resultAnimationSuccessBackgroundImage = UIImage()
        faceTechCustom.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = UIImage()
        faceTechCustom.resultScreenCustomization.customActivityIndicatorRotationInterval = 100000000
        faceTechCustom.resultScreenCustomization.foregroundColor = UIColor.white
        faceTechCustom.guidanceCustomization.buttonCornerRadius = 4
       
        idenfyLivenessUISettings.livenessCustomUISettings = faceTechCustom
        
        let idenfyUISettingsV2 = IdenfyUIBuilderV2()
            .withLivenessUISettings(idenfyLivenessUISettings)
            .build()
        
        

        let idenfySettingsV2 = IdenfyBuilderV2()
            .withAuthToken(authToken)
            .withUISettingsV2(idenfyUISettingsV2)
            .build()
        
        let customDrawer = CustomDrawer()
        
        customDrawer.toolbar.backButton.setImage("back".image, for: UIControl.State.normal)
        customDrawer.toolbar.idenfyToggleFlashButton.image = nil
        customDrawer.pageControl.currentPageIndicatorTintColor = "#FFC700".hexColor
        customDrawer.pageControl.pageIndicatorTintColor = "#FFC700".hexColor
        

//        let documentCameraView = DocumentCameraViewV2()
//        documentCameraView.cameraSessionsButtons.takePhotoButton.setBackgroundImage(UIImage(), for: .selected)
//
//        documentCameraView.cameraSessionsButtons.takePhotoButton.tintColor = UIColor.red
        
        let idenfyViewsV2: IdenfyViewsV2 = IdenfyViewsBuilderV2()
            .withSplashScreenV2View(SplashScreenV2View())
            .withNFCRequiredView(NFCRequiredViewV2())
            .withIssuedCountryView(IssuedCountryViewV2())
            .withCountrySelectionView(CountrySelectionViewV2())
            .withCountryCellView(CountryCell.self)
            .withLanguageSelectionView(LanguageSelectionViewV2())
            .withLanguageCellView(LanguageCell.self)
            .withDocumentSelectionView(DocumentSelectionViewV2())
            .withDocumentCellView(DocumentCell.self)
            .withConfirmationView(ConfirmationViewV2())
            .withConfirmationViewDocumentStepCellView(DocumentStepCell.self)
            .withCameraPermissionView(CameraPermissionViewV2())
            .withDrawerContentView(customDrawer)
            .withUploadPhotoView(UploadPhotoViewV2())
            .withDocumentCameraView(DocumentCameraViewV2())
            .withDocumentCameraResultView(DocumentCameraResultViewV2())
            .withPdfResultView(PdfResultViewV2())
            .withFaceCameraView(FaceCameraViewV2())
            .withFaceCameraResultView(FaceCameraResultViewV2())
            .withNFCReadingView(NFCReadingViewV2())
            .withNFCReadingTimeOutView(NFCReadingTimeOutViewV2())
            .withIdentificationResultsView(IdentificationResultsViewV2())
            .withIdentificationResultsStepCellView(ResultsStepCell.self)
            .build()

       
//        idenfyController.initializeIdenfySDKV2WithManual(idenfySettingsV2: idenfySettingsV2, idenfyViewsV2: idenfyViewsV2)
//        let idenfyVC = idenfyController.instantiateNavigationController()
//
//        present(idenfyVC, animated: true, completion: nil)
    }
    

}
