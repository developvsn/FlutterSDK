import Flutter
import UIKit
import iDenfySDK
import idenfycore
import idenfyviews
import IdenfyLiveness
import FaceTecSDK

public let idenfyController = IdenfyController.shared

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

                   
                    
                    UserDefaults.standard.set(authToken, forKey: "token")
//                     let idenfySettingsV2 = IdenfyBuilderV2()
//                         .withAuthToken(authToken)
//                         .build()
//
//
//                     idenfyController.initializeIdenfySDKV2WithManual(idenfySettingsV2: idenfySettingsV2)
                    // let idenfyVC = idenfyController.instantiateNavigationController()
                    
                    let nav = UINavigationController()
                    nav.modalPresentationStyle = .fullScreen
                    nav.pushViewController(SelectCountryVC(), animated: false)
                    UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
                
                    
                    
                    idenfyController.handleIdenfyCallbacksWithManualResults(idenfyIdentificationResult: {
                        idenfyIdentificationResult
                        in
                        do {
                            let jsonEncoder = JSONEncoder()
                            let jsonData = try jsonEncoder.encode(idenfyIdentificationResult)
                            let string = String(data: jsonData, encoding: String.Encoding.utf8)
                            result(string)
                            UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
                        } catch {
                        }
                    })
                }
            }
    }

}
