// ___FILEHEADER___

import Foundation

/// API endpoints for the ___VARIABLE_moduleName___ module.
/// 
/// Each case represents a concrete backend operation for this feature.
/// The enum conforms to `APIRouter`, which is provided by the Networking core.
public enum ___VARIABLE_moduleName___API {
  /// Fetches data for the given request.
  case fetch(request: ___VARIABLE_moduleName___Request)
  /// Persists the given entity (create/update).
  case persist(entity: ___VARIABLE_moduleName___Entity)
}

extension ___VARIABLE_moduleName___API: APIRouter {
  
  /// HTTP method used by the endpoint.
  public var method: HTTPMethod {
    switch self {
    case .fetch:
      return .get
    case .persist:
      return .post
    }
  }
  
  /// Path component appended to the base URL.
  /// - Note: These values are placeholders and should be adjusted per feature.
  public var path: String {
    switch self {
    case .fetch:
      return "/___VARIABLE_moduleNameLowercased___/fetch"
    case .persist:
      return "/___VARIABLE_moduleNameLowercased___/persist"
    }
  }
  
  /// Optional query items for the request.
  /// - Note: By default this implementation sends parameters in the body
  ///   for non-GET operations. You can move fields to the query string if needed.
  public var queryItems: [URLQueryItem]? {
    switch self {
    case let .fetch(request):
      // Example of mapping request properties to query parameters.
      return [
        URLQueryItem(name: "identifier", value: request.identifier),
        URLQueryItem(name: "payload", value: request.payload)
      ]
    case .persist:
      return nil
    }
  }
  
  /// Optional HTTP body for the request.
  /// - Note: For `fetch` the example uses query parameters only.
  ///   For `persist` the entity is encoded as JSON.
  public var body: Data? {
    switch self {
    case .fetch:
      return nil
    case let .persist(entity):
      let encoder = JSONEncoder()
      encoder.dateEncodingStrategy = .iso8601
      return try? encoder.encode(entity)
    }
  }
  
  /// Additional headers specific to the endpoint.
  /// - Note: Global headers such as `Content-Type` and `Accept`
  ///   are applied by the `HTTPConfiguration` in the Networking core.
  public var headers: [String: String]? {
    nil
  }
  
  /// Authorization type required by the endpoint.
  /// - Note: The default implementation uses bearer authorization.
  ///   Adjust this per case if needed (e.g., `.none` for public endpoints).
  public var authorizationType: AuthorizationType {
    switch self {
    case .fetch, .persist:
      return .bearer
    }
  }
}