// ___FILEHEADER___

import Foundation

/// Abstraction for data access of the ___VARIABLE_moduleName___ module.
///
/// This gateway defines the contract used by the domain layer (use cases)
/// to interact with data sources (remote and/or local).
/// Concrete implementations live in the Data layer and should not leak
/// infrastructure details (networking, persistence, etc.) into the domain.
public protocol ___VARIABLE_moduleName___Gateway {
  /// Fetches the main entity for the given request.
  ///
  /// - Parameter request: Request model containing the parameters required
  ///   to retrieve the entity.
  /// - Returns: A result containing the response model on success or an error
  ///   describing the failure.
  func fetch(
    _ request: ___VARIABLE_moduleName___Request
  ) async -> Result<___VARIABLE_moduleName___Response, Error>
  
  /// Performs an update or command operation for the given entity.
  ///
  /// This method is intended for write operations (create, update, delete)
  /// related to the module entity.
  ///
  /// - Parameter entity: The entity to be persisted or used as input
  ///   for the command operation.
  /// - Returns: A result indicating success or failure of the operation.
  func persist(
    _ entity: ___VARIABLE_moduleName___Entity
  ) async -> Result<Void, Error>
}