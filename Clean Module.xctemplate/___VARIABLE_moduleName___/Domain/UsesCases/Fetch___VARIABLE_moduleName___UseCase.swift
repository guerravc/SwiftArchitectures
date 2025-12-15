// ___FILEHEADER___

import Foundation

/// Example use case for fetching data of the ___VARIABLE_moduleName___ module.
/// 
/// This use case demonstrates how to interact with the gateway layer using the
/// base use case protocols provided by the App Core (e.g. `AsyncOperationUseCase`).
///
/// The output type is the domain entity, so presentation layers can work directly
/// with a clean model and map it to their own view models if needed.
public struct Fetch___VARIABLE_moduleName___UseCase: AsyncOperationUseCase {
  
  // MARK: - Input & Output
  
  /// Input required by the use case.
  /// In this case, a request model with parameters required by the backend.
  public struct Input: Sendable {
    public let request: ___VARIABLE_moduleName___Request
    
    public init(request: ___VARIABLE_moduleName___Request) {
      self.request = request
    }
  }
  
  /// Output produced by the use case.
  /// The use case exposes the domain entity instead of the raw response wrapper.
  public typealias Output = ___VARIABLE_moduleName___Entity
  
  // MARK: - Dependencies
  
  /// Gateway responsible for fetching the module's data.
  private let gateway: ___VARIABLE_moduleName___Gateway
  
  /// Creates a new instance of the use case.
  /// - Parameter gateway: Gateway used to perform the data-fetching operation.
  public init(gateway: ___VARIABLE_moduleName___Gateway) {
    self.gateway = gateway
  }
  
  // MARK: - Execute
  
  /// Executes the use case asynchronously.
  /// - Parameter input: Required parameters to perform the operation.
  /// - Returns: Result containing the domain entity or an error.
  public func execute(
    _ input: Input
  ) async -> Result<Output, Error> {
    let result = await gateway.fetch(input.request)
    
    switch result {
    case .success(let response):
      // Map the response wrapper to the pure domain entity.
      return .success(response.entity)
    case .failure(let error):
      return .failure(error)
    }
  }
}