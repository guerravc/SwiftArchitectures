//___FILEHEADER___

import Foundation

extension API.V3 {
	enum ___VARIABLE_moduleName___: APIRouter{
		case addSomething(entityId: Int)
		case fetchSomething(entityId: Int)
		case doSomething(entityId: Int)
		case deleteSomething(entityId: Int)

		var scheme: String {
			switch API.version {
				case .V3:
					return "https"
			}
		}

		var hostName: String {
			switch API.version {
				case .V3:
					return "some.url.com";
			}
		}

		var path: String {
			switch self {
				case .addSomething:
					return "path/to/addSomething"
				case .fetchSomething:
					return "path/to/fetchSomething"
				case .doSomething:
					return "path/to/doSomething"
				case .deleteSomething:
					return "path/to/deleteSomething"
			}
		}

		var method: HttpMethod {
			switch self {
				case .addSomething:
					return .post
				case .fetchSomething:
					return .get
				case .doSomething:
					return .put
				case .deleteSomething:
					return .delete
			}
		}

		var parameters: [URLQueryItem] {
			switch self {
				case .addSomething(let parameter):
					return [URLQueryItem(name: "parameterName", value: "\(parameter)")]
				case .fetchSomething(let parameter):
					return [URLQueryItem(name: "parameterName", value: "\(parameter)")]
				case .doSomething(let parameter):
					return [URLQueryItem(name: "parameterName", value: "\(parameter)")]
				case .deleteSomething(let parameter):
					return [URLQueryItem(name: "parameterName", value: "\(parameter)")]
			}
		}

		var body: String? {
			switch self {
				case .addSomething(let parameter):
					let dict = ["id": parameter]
          let jsonData = try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
          let jsonString = String(data: jsonData, encoding: .utf8)
					return jsonString
				case .fetchSomething, .doSomething, .deleteSomething:
					return nil
			}
		}

		var authorizationToken: String? {
			switch self {
				case .addSomething(let parameter):
          let loginString = String(format: "%@:%@", "username", "password")
          let loginData = loginString.data(using: String.Encoding.utf8)!
          let base64LoginString = loginData.base64EncodedString()
					return base64LoginString
				case .fetchSomething:
					let jwt = "try? keychain.getString(Constants.Keys.jsonWebToken)"
					return jwt
				case .doSomething, .deleteSomething:
					return nil
			}
		}

		var authenticationType: String? {
			switch self {
				case .addSomething:
					return NSURLAuthenticationMethodHTTPBasic
				case .fetchSomething:
					return NSURLAuthenticationMethodServerTrust
				case .doSomething, .deleteSomething:
					return nil
			}
		}
	}
}