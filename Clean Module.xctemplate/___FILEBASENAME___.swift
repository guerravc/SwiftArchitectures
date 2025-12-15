// ___FILEHEADER___

import Foundation

/// Entry file for the generated Clean module.
/// 
/// This file exists only to document the structure created by the template
/// and can be safely deleted after reviewing the generated module.
///
/// The Clean module template provides **Domain** and **Data** layers scoped
/// to a single feature (`___VARIABLE_moduleName___`).
///
///
/// ## Domain
///
/// Located under:
/// - `___VARIABLE_moduleName___/Domain/Entities/___VARIABLE_moduleName___Entity.swift`
///   - Defines the main domain entity for the module, along with example
///     request/response models that can be tailored to the feature.
/// 
/// - `___VARIABLE_moduleName___/Domain/Gateways/___VARIABLE_moduleName___Gateway.swift`
///   - Declares the `___VARIABLE_moduleName___Gateway` protocol used by
///     use cases to retrieve and persist data.
/// 
/// - `___VARIABLE_moduleName___/Domain/UseCases/Fetch___VARIABLE_moduleName___UseCase.swift`
///   - Example use case implementation using the gateway and the base
///     use case protocols from the App Core. It maps infrastructure
///     responses into the pure domain entity.
///
///
/// ## Data
///
/// Located under:
/// - `___VARIABLE_moduleName___/Data/API/___VARIABLE_moduleName___API.swift`
///   - Module-scoped `APIRouter` that defines the HTTP endpoints for the feature.
/// 
/// - `___VARIABLE_moduleName___/Data/Models/BaseResponses.swift`
///   - Generic response envelopes such as `BaseResponse<Value>`,
///     `EmptyResponseBody`, and `ErrorResponse`.
///
/// - `___VARIABLE_moduleName___/Data/Protocols/___VARIABLE_moduleName___DataSourceProtocol.swift`
///   - Declares `___VARIABLE_moduleName___RemoteDataSource` and
///     `___VARIABLE_moduleName___LocalDataSource` protocols.
/// 
/// - `___VARIABLE_moduleName___/Data/Services/Default___VARIABLE_moduleName___Service.swift`
///   - Default remote implementation using the Networking Core (`APIClient`)
///     and the module `APIRouter`.
/// 
/// - `___VARIABLE_moduleName___/Data/PersistentStorages/Default___VARIABLE_moduleName___Storage.swift`
///   - Default local storage implementation (no-op) ready to be customized
///     with the chosen persistence technology (UserDefaults, database, files, etc.).
/// 
/// - `___VARIABLE_moduleName___/Data/Repositories/Default___VARIABLE_moduleName___Repository.swift`
///   - Implements `___VARIABLE_moduleName___Gateway` by coordinating the
///     remote service and local storage, interpreting `BaseResponse` envelopes
///     and mapping them into domain-friendly results.
///
///
/// ## Deleting this File
///
/// This file is informational only and not required at runtime.
/// You may remove it once you are familiar with the generated structure.
struct ___FILEBASENAME___ { }