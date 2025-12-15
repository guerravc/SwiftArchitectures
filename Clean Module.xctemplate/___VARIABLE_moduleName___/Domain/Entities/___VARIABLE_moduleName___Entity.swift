// ___FILEHEADER___

import Foundation

/// Domain models for the ___VARIABLE_moduleName___ module.
/// 
/// This file is intended to be customized per feature. It contains:
/// - The main entity used by the module.
/// - A request model to send data to the backend.
/// - A response model to represent the result from the backend.
/// 
/// You can rename, extend or remove these types depending on your use case.
public struct ___VARIABLE_moduleName___Entity: Codable, Equatable, Sendable {
  /// Example identifier for the entity.
  public let id: UUID
  /// Example display name for the entity.
  public let name: String
  /// Example detail or level property for the entity.
  public let detail: String
  
  /// Creates a new instance of `___VARIABLE_moduleName___Entity`.
  /// - Parameters:
  ///   - id: Unique identifier of the entity.
  ///   - name: Display name of the entity.
  ///   - detail: Additional detail or level associated with the entity.
  public init(
    id: UUID,
    name: String,
    detail: String
  ) {
    self.id = id
    self.name = name
    self.detail = detail
  }
}

/// Request model used to send parameters required by the ___VARIABLE_moduleName___ module.
/// This type is typically encoded and sent as JSON in the request body or as query parameters.
public struct ___VARIABLE_moduleName___Request: Codable, Equatable, Sendable {
  /// Example parameter used to identify or filter the request.
  public let identifier: String
  /// Example parameter used to pass additional payload to the backend.
  public let payload: String
  
  /// Creates a new instance of `___VARIABLE_moduleName___Request`.
  /// - Parameters:
  ///   - identifier: Identifier used to correlate or filter the request.
///   - payload: Additional payload required by the backend.
  public init(
    identifier: String,
    payload: String
  ) {
    self.identifier = identifier
    self.payload = payload
  }
}

/// Response model representing the result returned by the backend for the
/// ___VARIABLE_moduleName___ module.
/// This type wraps the main entity and allows you to attach additional metadata.
public struct ___VARIABLE_moduleName___Response: Codable, Equatable, Sendable {
  /// The main entity returned by the backend.
  public let entity: ___VARIABLE_moduleName___Entity
  /// Example additional numeric value returned by the backend.
  public let extraValue: Int
  
  /// Creates a new instance of `___VARIABLE_moduleName___Response`.
  /// - Parameters:
  ///   - entity: The main entity returned by the backend.
///   - extraValue: Additional numeric value associated with the response.
  public init(
    entity: ___VARIABLE_moduleName___Entity,
    extraValue: Int
  ) {
    self.entity = entity
    self.extraValue = extraValue
  }
}