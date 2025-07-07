// ___FILEHEADER___

import Foundation
import UIKit

public enum AppInfo {
    public static let bundleName: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .bundleName)) ?? ""
    }

    public static let shortVersion: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .shortVersion)) ?? ""
    }

    public static let bundleVersion: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .bundleVersion)) ?? ""
    }

    public static let appName: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .appName)) ?? ""
    }

    public static let isPrerelease: Bool = {
        let digitSet = CharacterSet(charactersIn: "0123456789.")
        return AppInfo.shortVersion.rangeOfCharacter(from: digitSet.inverted) != nil
    }()

    public static let schema: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .schema)) ?? ""
    }

    public static let baseURL: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .baseURL)) ?? ""
    }

    public static let bucketURL: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .bucketURL)) ?? ""
    }

    public static let authenticationToken: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .PAT)) ?? ""
    }
}

public extension AppInfo {
    static let osName = "iOS"
    static let osVersion: String {
        let os = ProcessInfo.processInfo.operatingSystemVersion
        return "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
    }
}
