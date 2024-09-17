//___FILEHEADER___

import Foundation

final class ___VARIABLE_moduleName___Repository: ___VARIABLE_moduleName___Gateway {


  @Inject private let remoteDataSource: ___VARIABLE_moduleName___RemoteDataSource
  @Inject private let localDateSource: ___VARIABLE_moduleName___LocalDataSource
  static private let shared = ___VARIABLE_moduleName___Repository()

  private init() {}

  static func make() -> ___VARIABLE_moduleName___Gateway {
        shared
  }

  // Data fetch service methods goes here

  func addSomething(request: ___VARIABLE_moduleName___Request, completion: @escaping ___VARIABLE_moduleName___Result) {
    Task.init {
      do {
        let result = try await remoteDataSource.addSomething(request: request)
        completion(.success(result))
      } catch {
        completion(.failure(error))
      }
    }
  }
}