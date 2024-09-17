//___FILEHEADER___

import Foundation

struct ___VARIABLE_moduleName___Request: Codable {
    let input: ___VARIABLE_moduleName___

    enum CodingKeys: String, CodingKey {
        case input = "input"
    }

    func asDictionary() -> [String: Any] {
        ["input" : input]
    }
}