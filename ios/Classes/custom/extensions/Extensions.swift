//
//  UIExtensions.swift
//  idenfyviews
//
//  Created by Viktor Vostrikov on 2020-02-06.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

// swiftlint:disable all

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x0000_00FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        return String(format: "#%06x", rgb)
    }
}

extension UIView {
    public var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }

    public var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }

    public var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }

    public var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
}

extension UIView {
    func showWithAnimation(duration: TimeInterval = 0.5) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.isHidden = false
        })
    }

    func hideWithAnimation(duration: TimeInterval = 0.7) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.isHidden = true
        })
    }
}

extension UIView {
    func aspectRation(_ ratio: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: ratio, constant: 0)
    }
}

extension UIImageView {
    func setImageColor(_ color: UIColor?) {
        guard let unwrappedColor = color else { return }
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        image = templateImage
        tintColor = unwrappedColor
    }
}

extension UIButton {
    public func setImageWithTint(tintColor: UIColor?, uiImage: UIImage, uiState: UIControl.State = .normal) {
        guard let unwrappedColor = tintColor else {
            setImage(uiImage, for: uiState)
            return
        }

        setImage(uiImage.withRenderingMode(.alwaysTemplate), for: uiState)
        self.tintColor = unwrappedColor
    }
}

extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()

        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)

        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)

        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)

        case UIRectEdge.right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)

        default: do {}
        }

        border.backgroundColor = color.cgColor

        addSublayer(border)
    }
}

public extension UIWindow {
    var topViewController: UIViewController? {
        guard var top = rootViewController else {
            return nil
        }
        while let next = top.presentedViewController {
            top = next
        }
        return top
    }
}

enum Model: String {
    case simulator = "simulator/sandbox",
        iPod1 = "iPod 1",
        iPod2 = "iPod 2",
        iPod3 = "iPod 3",
        iPod4 = "iPod 4",
        iPod5 = "iPod 5",
        iPad2 = "iPad 2",
        iPad3 = "iPad 3",
        iPad4 = "iPad 4",
        iPhone4 = "iPhone 4",
        iPhone4S = "iPhone 4S",
        iPhone4s = "iPhone 4s",
        iPhone5 = "iPhone 5",
        iPhone5S = "iPhone 5S",
        iPhone5s = "iPhone 5s",
        iPhone5C = "iPhone 5C",
        iPhone5c = "iPhone 5c",
        iPadMini1 = "iPad Mini 1",
        iPadMini2 = "iPad Mini 2",
        iPadMini3 = "iPad Mini 3",
        iPadAir1 = "iPad Air 1",
        iPadAir2 = "iPad Air 2",
        iPadPro9_7 = "iPad Pro 9.7\"",
        iPadPro9_7_cell = "iPad Pro 9.7\" cellular",
        iPadPro12_9 = "iPad Pro 12.9\"",
        iPadPro12_9_cell = "iPad Pro 12.9\" cellular",
        iPhone6 = "iPhone 6",
        iPhone6plus = "iPhone 6 Plus",
        iPhone6S = "iPhone 6S",
        iPhone6Splus = "iPhone 6S Plus",
        iPhoneSE = "iPhone SE",
        iPhone7 = "iPhone 7",
        iPhone7plus = "iPhone 7 Plus",
        iPhone8 = "iPhone 8",
        iPhone8plus = "iPhone 8 Plus",
        iPhoneX = "iPhone X",
        unrecognized = "?unrecognized?"
}

extension UIDevice {
    var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String(validatingUTF8: ptr)
            }
        }
        let modelMap: [String: Model] = [
            "i386": .simulator,
            "x86_64": .simulator,
            "iPod1,1": .iPod1,
            "iPod2,1": .iPod2,
            "iPod3,1": .iPod3,
            "iPod4,1": .iPod4,
            "iPod5,1": .iPod5,
            "iPad2,1": .iPad2,
            "iPad2,2": .iPad2,
            "iPad2,3": .iPad2,
            "iPad2,4": .iPad2,
            "iPad2,5": .iPadMini1,
            "iPad2,6": .iPadMini1,
            "iPad2,7": .iPadMini1,
            "iPhone3,1": .iPhone4,
            "iPhone3,2": .iPhone4,
            "iPhone3,3": .iPhone4,
            "iPhone4,1": .iPhone4S,
            "iPhone5,1": .iPhone5,
            "iPhone5,2": .iPhone5,
            "iPhone5,3": .iPhone5C,
            "iPhone5,4": .iPhone5C,
            "iPad3,1": .iPad3,
            "iPad3,2": .iPad3,
            "iPad3,3": .iPad3,
            "iPad3,4": .iPad4,
            "iPad3,5": .iPad4,
            "iPad3,6": .iPad4,
            "iPhone6,1": .iPhone5S,
            "iPhone6,2": .iPhone5S,
            "iPad4,1": .iPadAir1,
            "iPad4,2": .iPadAir2,
            "iPad4,4": .iPadMini2,
            "iPad4,5": .iPadMini2,
            "iPad4,6": .iPadMini2,
            "iPad4,7": .iPadMini3,
            "iPad4,8": .iPadMini3,
            "iPad4,9": .iPadMini3,
            "iPad6,3": .iPadPro9_7,
            "iPad6,11": .iPadPro9_7,
            "iPad6,4": .iPadPro9_7_cell,
            "iPad6,12": .iPadPro9_7_cell,
            "iPad6,7": .iPadPro12_9,
            "iPad6,8": .iPadPro12_9_cell,
            "iPhone7,1": .iPhone6plus,
            "iPhone7,2": .iPhone6,
            "iPhone8,1": .iPhone6S,
            "iPhone8,2": .iPhone6Splus,
            "iPhone8,4": .iPhoneSE,
            "iPhone9,1": .iPhone7,
            "iPhone9,2": .iPhone7plus,
            "iPhone9,3": .iPhone7,
            "iPhone9,4": .iPhone7plus,
            "iPhone10,1": .iPhone8,
            "iPhone10,2": .iPhone8plus,
            "iPhone10,3": .iPhoneX,
        ]

        if let model = modelMap[String(validatingUTF8: modelCode!)!] {
            return model
        }
        return Model.unrecognized
    }
}

extension UIDevice {
    static let isIphone5OrBelow: Bool = {
        (UIDevice.modelName == Model.iPhone5.rawValue || UIDevice.modelName == Model.iPhone5S.rawValue || UIDevice.modelName == Model.iPhone5C.rawValue || UIDevice.modelName == Model.iPhone4.rawValue || UIDevice.modelName == Model.iPhone5s.rawValue || UIDevice.modelName == Model.iPhone5c.rawValue || UIDevice.modelName == Model.iPhone4s.rawValue || UIDevice.modelName == Model.iPhoneSE.rawValue)
    }()

    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
                switch identifier {
                case "iPod5,1": return "iPod touch (5th generation)"
                case "iPod7,1": return "iPod touch (6th generation)"
                case "iPod9,1": return "iPod touch (7th generation)"
                case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
                case "iPhone4,1": return "iPhone 4s"
                case "iPhone5,1", "iPhone5,2": return "iPhone 5"
                case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
                case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
                case "iPhone7,2": return "iPhone 6"
                case "iPhone7,1": return "iPhone 6 Plus"
                case "iPhone8,1": return "iPhone 6s"
                case "iPhone8,2": return "iPhone 6s Plus"
                case "iPhone9,1", "iPhone9,3": return "iPhone 7"
                case "iPhone9,2", "iPhone9,4": return "iPhone 7 Plus"
                case "iPhone8,4": return "iPhone SE"
                case "iPhone10,1", "iPhone10,4": return "iPhone 8"
                case "iPhone10,2", "iPhone10,5": return "iPhone 8 Plus"
                case "iPhone10,3", "iPhone10,6": return "iPhone X"
                case "iPhone11,2": return "iPhone XS"
                case "iPhone11,4", "iPhone11,6": return "iPhone XS Max"
                case "iPhone11,8": return "iPhone XR"
                case "iPhone12,1": return "iPhone 11"
                case "iPhone12,3": return "iPhone 11 Pro"
                case "iPhone12,5": return "iPhone 11 Pro Max"
                case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return "iPad 2"
                case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad (3rd generation)"
                case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad (4th generation)"
                case "iPad6,11", "iPad6,12": return "iPad (5th generation)"
                case "iPad7,5", "iPad7,6": return "iPad (6th generation)"
                case "iPad7,11", "iPad7,12": return "iPad (7th generation)"
                case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
                case "iPad5,3", "iPad5,4": return "iPad Air 2"
                case "iPad11,4", "iPad11,5": return "iPad Air (3rd generation)"
                case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad mini"
                case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad mini 2"
                case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad mini 3"
                case "iPad5,1", "iPad5,2": return "iPad mini 4"
                case "iPad11,1", "iPad11,2": return "iPad mini (5th generation)"
                case "iPad6,3", "iPad6,4": return "iPad Pro (9.7-inch)"
                case "iPad6,7", "iPad6,8": return "iPad Pro (12.9-inch)"
                case "iPad7,1", "iPad7,2": return "iPad Pro (12.9-inch) (2nd generation)"
                case "iPad7,3", "iPad7,4": return "iPad Pro (10.5-inch)"
                case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return "iPad Pro (11-inch)"
                case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return "iPad Pro (12.9-inch) (3rd generation)"
                case "AppleTV5,3": return "Apple TV"
                case "AppleTV6,2": return "Apple TV 4K"
                case "AudioAccessory1,1": return "HomePod"
                case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
                default: return identifier
                }
            #elseif os(tvOS)
                switch identifier {
                case "AppleTV5,3": return "Apple TV 4"
                case "AppleTV6,2": return "Apple TV 4K"
                case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
                default: return identifier
                }
            #endif
        }

        return mapToDevice(identifier: identifier)
    }()
}

extension UIDevice {
    var hasNotch: Bool {
        var bottom = CGFloat(0)
        if #available(iOS 11.0, *) {
            bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        }
        return bottom > 0
    }
}

extension UIViewController {
    @objc func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }

        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}
