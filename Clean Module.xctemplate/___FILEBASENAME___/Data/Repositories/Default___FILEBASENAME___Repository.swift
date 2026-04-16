// ___FILEHEADER___

import Foundation

/// Default repository implementation for the ___VARIABLE_moduleName___ module.
///
/// This type implements the domain `___VARIABLE_moduleName___Gateway` protocol and
/// coordinates the remote service and local storage layers. It is responsible for:
/// - Calling the remote data source (service) and interpreting `BaseResponse`
///   envelopes returned by the backend.
/// - Optionally caching entities in the local storage.
/// - Mapping infrastructure errors (network, backend) into domain-friendly errors.
public enum ___VARIABLE_moduleName___RepositoryError: Error {
  /// Represents an error payload returned by the backend.
  case backend(ErrorResponse)
  /// Represents a networking or low-level error.
  case network(Error)
  /// Indicates that the backend response did not contain the expected object.
  case emptyResponseObject
}

/// Default implementation of the module gateway, backed by a remote service
/// and an optional local storage.
public final class Default___VARIABLE_moduleName___Repository: ___VARIABLE_moduleName___Gateway {
  
  // MARK: - Dependencies
  
  private let remoteDataSource: ___VARIABLE_moduleName___RemoteDataSource
  private let localDataSource: ___VARIABLE_moduleName___LocalDataSource
  
  // MARK: - Init
  
  /// Creates a new repository instance.
  ///
  /// - Parameters:
  ///   - remoteDataSource: Remote data source used to perform backend requests.
  ///   - localDataSource: Local data source used to cache or retrieve entities.
  public init(
    remoteDataSource: ___VARIABLE_moduleName___RemoteDataSource,
    localDataSource: ___VARIABLE_moduleName___LocalDataSource
  ) {
    self.remoteDataSource = remoteDataSource
    self.localDataSource = localDataSource
  }
  
  // MARK: - ___VARIABLE_moduleName___Gateway
  
  /// Fetches data for the given request by delegating to the remote data source
  /// and interpreting the backend `BaseResponse` envelope.
  ///
  /// - Parameter request: Request model to be sent to the backend.
/// - Returns: A result containing the module response or an error.
  public func fetch(
    _ request: ___VARIABLE_moduleName___Request
  ) async -> Result<___VARIABLE_moduleName___Response, Error> {
    do {
      let baseResponse = try await remoteDataSource.fetch(request)
      
      guard baseResponse.isSuccessful else {
        let errorResponse = ErrorResponse(
          status: baseResponse.status,
          message: baseResponse.message,
          code: nil
        )
        return .failure(___VARIABLE_moduleName___RepositoryError.backend(errorResponse))
      }
      
      guard let response = baseResponse.object else {
        return .failure(___VARIABLE_moduleName___RepositoryError.emptyResponseObject)
      }
      
      // Optional caching of the main entity.
      // Errors from local storage are intentionally ignored here to avoid
      // turning a successful backend call into a failure due to cache issues.
      do {
        try await localDataSource.save(response.entity)
      } catch {
        // Consider logging the error using your logging utility from App Core.
      }
      
      return .success(response)
    } catch {
      return .failure(___VARIABLE_moduleName___RepositoryError.network(error))
    }
  }
  
  /// Persists the given entity by delegating to the remote data source and
  /// optionally updating the local storage.
  ///
  /// - Parameter entity: The entity to be persisted.
/// - Returns: A result indicating whether the operation succeeded or failed.
  public func persist(
    _ entity: ___VARIABLE_moduleName___Entity
  ) async -> Result<Void, Error> {
    do {
      let baseResponse = try await remoteDataSource.persist(entity)
      
      guard baseResponse.isSuccessful else {
        let errorResponse = ErrorResponse(
          status: baseResponse.status,
          message: baseResponse.message,
          code: nil
        )
        return .failure(___VARIABLE_moduleName___RepositoryError.backend(errorResponse))
      }
      
      // Optional local update after a successful remote operation.
      do {
        try await localDataSource.save(entity)
      } catch {
        // Consider logging the error using your logging utility from App Core.
      }
      
      return .success(())
    } catch {
      return .failure(___VARIABLE_moduleName___RepositoryError.network(error))
    }
  }
}