//___FILEHEADER___

import Foundation

extension API.V3 {
	enum ___VARIABLE_moduleName___: APIRouter{
		case addSomething(request: ___VARIABLE_moduleName___Request)
		case fetchSomething(request: ___VARIABLE_moduleName___Request)
		case doSomething(request: ___VARIABLE_moduleName___Request)
		case deleteSomething(request: ___VARIABLE_moduleName___Request)

		var scheme: String {
			switch API.version {
				case .V3:
					return AppInfo.schema
			}
		}

		var hostName: String {
			switch API.version {
				case .V3:
					return AppInfo.baseURL
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
				case let .addSomething(request):
					return [URLQueryItem(name: "parameterName", value: "\(request.input)")]
				case let .fetchSomething(request):
					return [URLQueryItem(name: "parameterName", value: "\(request.input)")]
				case let .doSomething(request):
					return [URLQueryItem(name: "parameterName", value: "\(request.input)")]
				case let .deleteSomething(request):
					return [URLQueryItem(name: "parameterName", value: "\(request.input)")]
			}
		}

		var body: String? {
			switch self {
				case let .addSomething(request):
          			let jsonData = try! JSONSerialization.data(withJSONObject: request.asDictionary(), options: .prettyPrinted)
          			let jsonString = String(data: jsonData, encoding: .utf8)
					return jsonString
				case .fetchSomething, .doSomething, .deleteSomething:
					return nil
			}
		}

		var authorizationToken: String? {
			switch self {
				case let .addSomething(request):
          			let loginString = String(format: "%@:%@", request.input, request.input)
          			let loginData = loginString.data(using: String.Encoding.utf8)!
          			let base64LoginString = loginData.base64EncodedString()
					return base64LoginString
				case .fetchSomething:
					return AppInfo.authenticationToken
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