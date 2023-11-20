//___FILEHEADER___

import Foundation

final class ___VARIABLE_moduleName___Service: ___VARIABLE_moduleName___RemoteDataSource {

  static let shared = ___VARIABLE_moduleName___Service()

  private init(){}

  // Data fetch service methods goes here

  func addSomething(entityId: Int) async throws -> ___VARIABLE_moduleName___ {
    let response: ___VARIABLE_moduleName___Response = try await APIRequestDispatcher.request(apiRouter: API.V3.___VARIABLE_moduleName___.addSomething(entityId: entityId))
    return response.output
  }
}