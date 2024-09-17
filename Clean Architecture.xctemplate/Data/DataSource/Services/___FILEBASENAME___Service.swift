//___FILEHEADER___

import Foundation

final class ___VARIABLE_moduleName___Service: ___VARIABLE_moduleName___RemoteDataSource {

  static let shared = ___VARIABLE_moduleName___Service()
  @Inject private var dispatcher: ___VARIABLE_moduleName___APIRequestDispatcher

  private init(){}

  // Data fetch service methods goes here

  func addSomething(request: ___VARIABLE_moduleName___Request) async throws -> ___VARIABLE_moduleName___Response {
    let response: ___VARIABLE_moduleName___Response = try await dispatcher.request(apiRouter: API.V3.___VARIABLE_moduleName___.addSomething(request: request))
    return response
  }
}