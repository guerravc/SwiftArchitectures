// ___FILEHEADER___

import Foundation

enum ___VARIABLE_moduleName___Configuration {
    enum InfoKey: String {
        case bundleName = "CFBundleName"
        case shortVersion = "CFBundleShortVersionString"
        case bundleVersion = kCFBundleVersionKey as String
        case appNAme = kCFBundleNameKey as String
        case schema = "Schema"
        case baseURL = "BaseURL"
        case bucketURL = "BucketURL"
        case PAT = "___VARIABLE_moduleName___PAT"
    }

    enum ___VARIABLE_moduleName___ConfigurationError: Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: InfoKey) throws -> T where T: LosslessStringConvertible {
        try value(for: key.rawValue)
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw ___VARIABLE_moduleName___ConfigurationError.missingKey
        }

        guard let value = object as? T else {
            throw ___VARIABLE_moduleName___ConfigurationError.invalidValue
        }
        return value
    }
}
