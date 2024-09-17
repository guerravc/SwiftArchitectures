//___FILEHEADER___

import Foundation
import UIKit

enum AppInfo {
  static let bundleName: String {
      return (try? ___VARIABLE_moduleName___Configuration.value(for: .bundleName)) ?? ""
  }

  static let shortVersion: String {
      return (try? ___VARIABLE_moduleName___Configuration.value(for: .shortVersion)) ?? ""
  }

  static let bundleVersion: String {
      return (try? ___VARIABLE_moduleName___Configuration.value(for: .bundleVersion)) ?? ""
  }

  static let appName: String {
      return (try? ___VARIABLE_moduleName___Configuration.value(for: .appName)) ?? ""
  }

  static let isPrerelease: Bool = {
      let digitSet = CharacterSet(charactersIn: "0123456789.")
      return (AppInfo.shortVersion.rangeOfCharacter(from: digitSet.inverted) != nil)
  }()

  public static var schema: String {
      return (try? ___VARIABLE_moduleName___Configuration.value(for: .schema)) ?? ""
  }
    
  public static var baseURL: String {
      return (try? ___VARIABLE_moduleName___Configuration.value(for: .baseURL)) ?? ""
  }
    
  public static var bucketURL: String {
      return (try? ___VARIABLE_moduleName___Configuration.value(for: .bucketURL)) ?? ""
  }
    
  public static var authenticationToken: String {
      return (try? ___VARIABLE_moduleName___Configuration.value(for: .PAT)) ?? ""
  }
}

extension AppInfo {
  static var osName = "iOS"
  static var osVersion: String {
    let os = ProcessInfo.processInfo.operatingSystemVersion
    return "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
  }
}