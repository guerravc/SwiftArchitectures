// ___FILEHEADER___

import Foundation

public enum AppInfo {
    public static var bundleName: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .bundleName)) ?? ""
    }

    public static var shortVersion: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .shortVersion)) ?? ""
    }

    public static var bundleVersion: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .bundleVersion)) ?? ""
    }

    public static var appName: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .appName)) ?? ""
    }

    public static var isPrerelease: Bool = {
        let digitSet = CharacterSet(charactersIn: "0123456789.")
        return AppInfo.shortVersion.rangeOfCharacter(from: digitSet.inverted) != nil
    }()

    public static var schema: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .schema)) ?? ""
    }

    public static var baseURL: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .baseURL)) ?? ""
    }

    public static var bucketURL: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .bucketURL)) ?? ""
    }

    public static var authenticationToken: String {
        (try? ___VARIABLE_moduleName___Configuration.value(for: .PAT)) ?? ""
    }
}

public extension AppInfo {
    static let osName = "iOS"
    static var osVersion: String {
        let os = ProcessInfo.processInfo.operatingSystemVersion
        return "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
    }
}
