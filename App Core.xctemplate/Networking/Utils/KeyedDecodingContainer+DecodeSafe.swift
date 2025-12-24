// ___FILEHEADER___


import Foundation

extension KeyedDecodingContainer {

    func decodeSafe<T: Decodable>(_ type: T.Type, forKey key: Key) -> T? {

        if let value = try? decodeIfPresent(T.self, forKey: key) {
            return value
        }

        if let stringValue = try? decodeIfPresent(String.self, forKey: key) {
            return convertString(stringValue, to: T.self)
        }

        if let intValue = try? decodeIfPresent(Int.self, forKey: key) {
            return convertString(String(intValue), to: T.self)
        }
        if let doubleValue = try? decodeIfPresent(Double.self, forKey: key) {
            return convertString(String(doubleValue), to: T.self)
        }
        if let boolValue = try? decodeIfPresent(Bool.self, forKey: key) {
            return convertString(boolValue ? "true" : "false", to: T.self)
        }

        if let dictionary = try? decodeIfPresent([String: AnyDecodable].self, forKey: key) {
            let any = dictionary.mapValues { $0.value }
            return decodeViaJSON(any, as: T.self)
        }

        if let array = try? decodeIfPresent([AnyDecodable].self, forKey: key) {
            let any = array.map { $0.value }
            return decodeViaJSON(any, as: T.self)
        }

        return nil
    }

    private func convertString<T: Decodable>(_ value: String, to type: T.Type) -> T? {
        if type == String.self { return value as? T }
        if type == Int.self { return Int(value.trimmingCharacters(in: .whitespacesAndNewlines)) as? T }
        if type == Double.self { return Double(value.trimmingCharacters(in: .whitespacesAndNewlines)) as? T }
        if type == Bool.self { return parseBool(value) as? T }
        return nil
    }

    private func parseBool(_ stringValue: String) -> Bool? {
        switch stringValue.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() {
        case "true", "t", "yes", "y", "1": return true
        case "false", "f", "no", "n", "0": return false
        default: return nil
        }
    }

    private func decodeViaJSON<T: Decodable>(_ any: Any, as type: T.Type) -> T? {
        guard JSONSerialization.isValidJSONObject(any) else { return nil }
        guard let data = try? JSONSerialization.data(withJSONObject: any) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    struct AnyDecodable: Decodable {
        let value: Any

        init(from decoder: Decoder) throws {
            let codedValue = try decoder.singleValueContainer()
            if let intValue = try? codedValue.decode(Int.self) { value = intValue; return }
            if let doubleValue = try? codedValue.decode(Double.self) { value = doubleValue; return }
            if let boolValue = try? codedValue.decode(Bool.self) { value = boolValue; return }
            if let stringValue = try? codedValue.decode(String.self) { value = stringValue; return }
            if let arrayValue = try? codedValue.decode([AnyDecodable].self) { value = arrayValue.map(\.value); return }
            if let dictionaryValue = try? codedValue.decode([String: AnyDecodable].self) { value = dictionaryValue.mapValues(\.value); return }
            value = NSNull()
        }
    }
}
