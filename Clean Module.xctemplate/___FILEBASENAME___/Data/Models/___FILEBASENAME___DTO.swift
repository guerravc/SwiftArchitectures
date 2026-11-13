// ___FILEHEADER___

import Foundation

/// Data Transfer Object for `___VARIABLE_moduleName___Entity`.
///
/// This type mirrors the domain entity fields and adds `Codable` conformance
/// for JSON serialization. The domain `___VARIABLE_moduleName___Entity` remains
/// free of serialization concerns.
///
/// Use `toDomain()` to convert to the domain entity, and `init(entity:)` to
/// convert a domain entity back to a DTO for encoding.
public nonisolated struct ___VARIABLE_moduleName___EntityDTO: Codable, Sendable {
  /// Entity identifier.
  public let id: UUID
  /// Display name.
  public let name: String
  /// Detail or level property.
  public let detail: String

  /// Creates a new instance of `___VARIABLE_moduleName___EntityDTO`.
  /// - Parameters:
  ///   - id: Unique identifier of the entity.
  ///   - name: Display name of the entity.
  ///   - detail: Additional detail associated with the entity.
  public init(id: UUID, name: String, detail: String) {
    self.id = id
    self.name = name
    self.detail = detail
  }

  /// Creates a DTO from a domain entity.
  /// - Parameter entity: Domain entity to convert.
  public init(entity: ___VARIABLE_moduleName___Entity) {
    self.id = entity.id
    self.name = entity.name
    self.detail = entity.detail
  }

  /// Maps this DTO to the corresponding domain entity.
  public func toDomain() -> ___VARIABLE_moduleName___Entity {
    ___VARIABLE_moduleName___Entity(id: id, name: name, detail: detail)
  }
}

/// Data Transfer Object for the response envelope of the ___VARIABLE_moduleName___ module.
///
/// This type wraps `___VARIABLE_moduleName___EntityDTO` and is decoded directly from
/// the backend JSON. Use `toDomain()` to convert to the domain response.
public nonisolated struct ___VARIABLE_moduleName___ResponseDTO: Codable, Sendable {
  /// The entity DTO as received from the backend.
  public let entity: ___VARIABLE_moduleName___EntityDTO
  /// Additional numeric value from the backend.
  public let extraValue: Int

  /// Creates a new instance of `___VARIABLE_moduleName___ResponseDTO`.
  /// - Parameters:
  ///   - entity: The entity DTO from the backend.
  ///   - extraValue: Additional numeric value associated with the response.
  public init(entity: ___VARIABLE_moduleName___EntityDTO, extraValue: Int) {
    self.entity = entity
    self.extraValue = extraValue
  }

  /// Maps this DTO to the corresponding domain response.
  public func toDomain() -> ___VARIABLE_moduleName___Response {
    ___VARIABLE_moduleName___Response(
      entity: entity.toDomain(),
      extraValue: extraValue
    )
  }
}
