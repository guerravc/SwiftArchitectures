// ___FILEHEADER___

import Foundation

/// High-level HTTP client built on top of `APIRequestDispatching`.
/// This client is responsible for decoding JSON payloads into `Decodable` types
/// and exposing convenient APIs for one-shot requests and server-sent events (SSE).
public protocol APIClient {
  /// Performs a one-shot HTTP request and decodes the response body into a `Decodable` type.
  ///
  /// El tipo genérico `T` se infiere a partir del contexto donde se llama,
  /// por ejemplo:
  ///
  /// ```swift
  /// let result: Result<UserDTO, NetworkError> = await apiClient.request(UserAPI.fetchProfile)
  /// ```
  ///
  /// - Parameter route: Endpoint definition.
  /// - Returns: A result containing the decoded value or a `NetworkError`.
  func request<T: Decodable>(
    _ route: APIRouter
  ) async -> Result<T, NetworkError>
  
  /// Performs a one-shot HTTP request and returns the raw response data.
  ///
  /// - Parameter route: Endpoint definition.
  /// - Returns: A result containing the raw response data or a `NetworkError`.
  func requestData(
    _ route: APIRouter
  ) async -> Result<Data, NetworkError>
  
  /// Starts a server-sent events (SSE) stream and returns a typed `AsyncStream`.
  ///
  /// El tipo genérico `T` también se infiere a partir del contexto:
  ///
  /// ```swift
  /// let result: Result<AsyncStream<EventDTO>, NetworkError> =
  ///   await apiClient.stream(EventsAPI.subscribe)
  /// ```
  ///
  /// - Parameter route: Endpoint definition.
  /// - Returns: A result containing an `AsyncStream` of decoded values or a `NetworkError`.
  func stream<T: Decodable>(
    _ route: APIRouter
  ) async -> Result<AsyncStream<T>, NetworkError>
}

/// Default implementation of `APIClient` that uses an `APIRequestDispatching`
/// instance to perform HTTP requests and JSON decoding.
public final class DefaultAPIClient: APIClient {
  
  /// Dispatcher responsible for executing HTTP requests.
  private let dispatcher: APIRequestDispatching
  /// JSON decoder used to decode response payloads.
  private let decoder: JSONDecoder
  
  /// Creates a new API client.
  ///
  /// - Parameters:
  ///   - dispatcher: Dispatcher used to perform requests.
  ///   - decoder: JSON decoder used for decoding responses. Defaults to `JSONDecoder()`.
  public init(
    dispatcher: APIRequestDispatching,
    decoder: JSONDecoder = JSONDecoder()
  ) {
    self.dispatcher = dispatcher
    self.decoder = decoder
  }
  
  /// Performs a one-shot HTTP request and decodes the response body into a `Decodable` type.
  ///
  /// - Parameter route: Endpoint definition.
  /// - Returns: A result containing the decoded value or a `NetworkError`.
  public func request<T: Decodable>(
    _ route: APIRouter
  ) async -> Result<T, NetworkError> {
    let result = await dispatcher.perform(route)
    
    switch result {
    case .failure(let error):
      return .failure(error)
    case .success(let response):
      do {
        let value = try decoder.decode(T.self, from: response.data)
        return .success(value)
      } catch {
        return .failure(.decodingError(error))
      }
    }
  }
  
  /// Performs a one-shot HTTP request and returns the raw response data.
  ///
  /// - Parameter route: Endpoint definition.
  /// - Returns: A result containing the raw response data or a `NetworkError`.
  public func requestData(
    _ route: APIRouter
  ) async -> Result<Data, NetworkError> {
    let result = await dispatcher.perform(route)
    
    switch result {
    case .failure(let error):
      return .failure(error)
    case .success(let response):
      return .success(response.data)
    }
  }
  
  /// Starts a server-sent events (SSE) stream and returns a typed `AsyncStream`.
  ///
  /// - Parameter route: Endpoint definition.
  /// - Returns: A result containing an `AsyncStream` of decoded values or a `NetworkError`.
  public func stream<T: Decodable>(
    _ route: APIRouter
  ) async -> Result<AsyncStream<T>, NetworkError> {
    // Aquí seguimos delegando en el dispatcher, que aún recibe `as: T.Type`.
    await dispatcher.stream(route)
  }
}