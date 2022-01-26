//
//  Resizer.swift
//  Resizer
import UIKit

enum ResizerType {
  case width, height
}

enum ResizerModel {
  case iPhoneX,
  iPhoneXsMax,
  iPhoneXr,
  iPhone,
  iPhonePlus,
  iPhone5,
  iPad97,
  iPad129
  
  var width: CGFloat {
    switch self {
    case .iPhoneX: return 375
    case .iPhoneXsMax: return 414
    case .iPhoneXr: return 414
    case .iPhone: return 375
    case .iPhonePlus: return 414
    case .iPhone5: return 320
    case .iPad97: return 1024
    case .iPad129: return 1366
    }
  }
  var height: CGFloat {
    switch self {
    case .iPhoneX: return 812
    case .iPhoneXsMax: return 896
    case .iPhoneXr: return 896
    case .iPhone: return 667
    case .iPhonePlus: return 736
    case .iPhone5: return 568
    case .iPad97: return 768
    case .iPad129: return 1024
    }
  }
}

protocol Resizer { }
extension Resizer {
  func resized(_ type: ResizerType) -> CGFloat {
    return resized(type: type)
  }
  func resized(type: ResizerType = .height, base model: ResizerModel = .iPhoneX) -> CGFloat {
    let value = (self as? NSNumber) ?? 0
    switch type {
    case .width: return UIScreen.main.bounds.width * (CGFloat(truncating: value)/model.width)
    case .height: return UIScreen.main.bounds.height * (CGFloat(truncating: value)/model.height)
    }
  }
}

protocol ViewResizer {}
extension ViewResizer {
  func resized(_ model: ResizerModel = .iPhoneX) {
    let value = self as! UIView
    value.frame = CGRect(origin: CGPoint(x: value.frame.origin.x.resized(type: .width, base: model),
                                         y: value.frame.origin.y.resized(type: .height, base: model)),
                         size: CGSize(width: value.frame.width.resized(type: .width, base: model),
                                      height: value.frame.height.resized(type: .height, base: model)))
  }
}

protocol SizeResizer {}
extension SizeResizer {
  func resized(_ model: ResizerModel = .iPhoneX) -> CGSize {
    let value = self as! CGSize
    return CGSize(width: value.width.resized(type: .width, base: model),
                  height: value.height.resized(type: .height, base: model))
  }
}

protocol PointResizer {}
extension PointResizer {
  func resized(_ model: ResizerModel = .iPhoneX) -> CGPoint {
    let value = self as! CGPoint
    return CGPoint(x: value.x.resized(type: .width, base: model),
                   y: value.y.resized(type: .height, base: model))
  }
}

protocol RectangleResizer {}
extension RectangleResizer {
  func resized(_ model: ResizerModel = .iPhoneX) -> CGRect {
    let value = self as! CGRect
    return CGRect(origin: value.origin.resized(),
                  size: value.size.resized())
  }
}

protocol InsetResizer {}
extension InsetResizer {
  func resized(_ model: ResizerModel = .iPhoneX) -> UIEdgeInsets {
    let value = self as! UIEdgeInsets
    return UIEdgeInsets(top: value.top.resized(type: .height, base: model),
                        left: value.left.resized(type: .width, base: model),
                        bottom: value.bottom.resized(type: .height, base: model),
                        right: value.right.resized(type: .width, base: model))
  }
}

extension Int: Resizer {}
extension UInt: Resizer {}
extension Double: Resizer {}
extension Float: Resizer {}
extension CGFloat: Resizer {}
extension CGSize: SizeResizer {}
extension CGPoint: PointResizer {}
extension CGRect: RectangleResizer {}
extension UIView: ViewResizer {}
extension UIEdgeInsets: InsetResizer {}
