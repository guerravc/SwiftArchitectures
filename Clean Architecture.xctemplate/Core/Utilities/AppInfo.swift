//___FILEHEADER___

import Foundation
import UIKit

enum AppInfo {
  static let dwWebURI = Bundle.main.object(forInfoDictionaryKey: "DWWebURI") as? String ?? ""
  static let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
  static let shortVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
  static let bundleVersion = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
  static let appName = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String ?? ""
  static let isPrerelease: Bool = {
    let digitSet = CharacterSet(charactersIn: "0123456789.")
    return (AppInfo.shortVersion.rangeOfCharacter(from: digitSet.inverted) != nil)
  }()
}

extension AppInfo {
  static var osName = "iOS"
  static var osVersion: String {
    let os = ProcessInfo.processInfo.operatingSystemVersion
    return "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
  }
}