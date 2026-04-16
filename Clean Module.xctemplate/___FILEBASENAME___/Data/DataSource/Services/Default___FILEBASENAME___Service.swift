// ___FILEHEADER___

import Foundation

/// Default remote service implementation for the ___VARIABLE_moduleName___ module.
///
/// This type implements `___VARIABLE_moduleName___RemoteDataSource` using the
/// Networking Core (`APIClient`) and the module-specific `___VARIABLE_moduleName___API`
/// router. It is responsible for performing HTTP calls and decoding responses
/// into DTOs wrapped by `BaseResponse` envelopes.
public final class Default___VARIABLE_moduleName___Service: ___VARIABLE_moduleName___RemoteDataSource {

  // MARK: - Dependencies

  /// High-level HTTP client used to perform network requests.
  private let apiClient: APIClient

  // MARK: - Init

  /// Creates a new remote service instance.
  ///
  /// - Parameter apiClient: API client used to perform HTTP requests.
  public init(apiClient: APIClient) {
    self.apiClient = apiClient
  }

  // MARK: - ___VARIABLE_moduleName___RemoteDataSource

  /// Fetches data from the remote backend using the given request.
  ///
  /// The response is expected to be wrapped in a `BaseResponse` envelope whose
  /// `object` payload is the module response DTO.
  ///
  /// Example payload shape:
  ///
  /// ```json
  /// {
  ///   "status": 0,
  ///   "message": "OK",
  ///   "object": { /* ___VARIABLE_moduleName___ResponseDTO fields */ }
  /// }
  /// ```
  ///
  /// - Parameter request: Request model containing the parameters required
  ///   by the backend.
  /// - Returns: A `BaseResponse` wrapping the module response DTO.
  /// - Throws: A `NetworkError` if the request fails or the payload cannot be decoded.
  public func fetch(
    _ request: ___VARIABLE_moduleName___Request
  ) async throws -> BaseResponse<___VARIABLE_moduleName___ResponseDTO> {
    let route = ___VARIABLE_moduleName___API.fetch(request: request)

    let result: Result<BaseResponse<___VARIABLE_moduleName___ResponseDTO>, NetworkError> =
      await apiClient.request(route)

    switch result {
    case .success(let response):
      return response
    case .failure(let error):
      throw error
    }
  }

  /// Persists the given entity DTO on the remote backend (create, update, delete, etc.).
  ///
  /// The backend is expected to respond with an "empty" envelope that only
  /// carries status and message information (no `object` payload).
  ///
  /// - Parameter dto: The entity DTO to be sent to the backend.
  /// - Returns: An `EmptyBaseResponse` describing backend status and message.
  /// - Throws: A `NetworkError` if the request fails or the payload cannot be decoded.
  public func persist(
    _ dto: ___VARIABLE_moduleName___EntityDTO
  ) async throws -> EmptyBaseResponse {
    let route = ___VARIABLE_moduleName___API.persist(dto: dto)

    let result: Result<EmptyBaseResponse, NetworkError> =
      await apiClient.request(route)

    switch result {
    case .success(let response):
      return response
    case .failure(let error):
      throw error
    }
  }
}
