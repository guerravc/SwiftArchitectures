//___FILEHEADER___

import Foundation

// MARK: - Remote (Repository -> RemoteDataSource)
protocol ___VARIABLE_moduleName___RemoteDataSource {
  // TODO: Data fetch functions from server
  func addSomething(entityId: Int) async throws -> ___VARIABLE_moduleName___
}

// MARK: - Local (Repository -> LocalDataSource)
protocol ___VARIABLE_moduleName___LocalDataSource {
 // TODO: Data fetch functions from local database

}