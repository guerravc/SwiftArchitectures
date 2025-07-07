// ___FILEHEADER___

import Foundation

protocol Dispatcher {
    func request<T: Codable>(apiRouter: APIRouter) async throws -> T
}

class ___VARIABLE_moduleName___APIRequestDispatcher: Dispatcher {
    static let shared = ___VARIABLE_moduleName___APIRequestDispatcher()

    private init() {}

    private func createAPIRequest(_ apiRouter: some APIRouter) throws -> URLRequest {
        var components = URLComponents()
        components.host = apiRouter.hostName
        components.scheme = apiRouter.scheme
        components.path = apiRouter.path
        components.queryItems = apiRouter.parameters

        guard let url = components.url else { throw ServerError.badUrl }

        var request = URLRequest(url: url)

        request.httpMethod = apiRouter.method.rawValue
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        API.configure(&request)

        if let authToken = apiRouter.authorizationToken, !authToken.isEmpty {
            if apiRouter.authenticationType == NSURLAuthenticationMethodHTTPBasic {
                request.addValue("Basic \(authToken)", forHTTPHeaderField: "Authorization")
            } else if apiRouter.authenticationType == NSURLAuthenticationMethodServerTrust {
                request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
            } else {
                request.addValue(authToken, forHTTPHeaderField: "Authorization")
            }
        }

        if let dataBody = apiRouter.body {
            request.httpBody = dataBody.data(using: String.Encoding.utf8)
        }

        return request
    }

    func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
        guard let urlRequest = try? createAPIRequest(apiRouter) else {
            throw ServerError.badUrl
        }

        let session = URLSession(configuration: .default)
        return try await withCheckedThrowingContinuation { continuation in
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }

                let httpResponse = response as? HTTPURLResponse

                if httpResponse?.statusCode == 200 {
                    guard let data = data else {
                        return continuation.resume(with: .failure(ServerError.network(issue: .resourceNotFound)))
                    }

                    do {
                        let responseObject = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            continuation.resume(with: .success(responseObject))
                        }
                    } catch {
                        return continuation.resume(with: .failure(error))
                    }
                } else {
                    return continuation.resume(with: .failure(ServerError(status: HttpStatusCode(rawValue: httpResponse!.statusCode)!)))
                }
            }
            dataTask.resume()
        }
    }
}
