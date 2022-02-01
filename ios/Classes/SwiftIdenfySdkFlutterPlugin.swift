import Flutter
import UIKit
import iDenfySDK
import idenfycore
import idenfyviews
import IdenfyLiveness
import FaceTecSDK

public class SwiftIdenfySdkFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "idenfy_sdk_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftIdenfySdkFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getPlatformVersion" {
          result("iOS " + UIDevice.current.systemVersion)
        } else if call.method == "start" {
            if let arguments = call.arguments as? [String: Any],
               let authToken = arguments["authToken"] as? String {

                
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
                
                
		







IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewCellHighlightedBackgroundColor = UIColor(white: 1, alpha: 0.0)
        IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewBackgroundColor = .white
        IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewCellHeight = 66
        IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTypeHighlightedFont = .systemFont(ofSize: 16, weight: .semibold)
        IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTypeFont = .systemFont(ofSize: 16, weight: .medium)
        IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewCellHighlightedTextColor = "161617".hexColor
        
        IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountryTableViewCellHighlightedTextColor = "#494949".hexColor
        IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountryTableViewHighlightedCellFont = .systemFont(ofSize: 14, weight: .semibold)
        IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountryTableViewCellHighlightedBackgroundColor = UIColor(white: 1, alpha: 0.0)


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
                

                let idenfyController = IdenfyController.shared
                idenfyController.initializeIdenfySDKV2WithManual(idenfySettingsV2: idenfySettingsV2, idenfyViewsV2: idenfyViewsV2)
                let idenfyVC = idenfyController.instantiateNavigationController()

                UIApplication.shared.keyWindow?.rootViewController?.present(idenfyVC, animated: true, completion: nil)

                idenfyController.handleIdenfyCallbacksWithManualResults(idenfyIdentificationResult: {
                    idenfyIdentificationResult
                    in
                    do {
                        let jsonEncoder = JSONEncoder()
                        let jsonData = try jsonEncoder.encode(idenfyIdentificationResult)
                        let string = String(data: jsonData, encoding: String.Encoding.utf8)
                        result(string)
                    } catch {
                    }
                })
            }
        }
    }
}
