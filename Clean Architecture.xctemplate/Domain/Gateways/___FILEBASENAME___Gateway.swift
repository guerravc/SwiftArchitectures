//___FILEHEADER___

import Foundation

typealias ___VARIABLE_moduleName___Result = (Result<___VARIABLE_moduleName___Response, Error>) -> Void

protocol ___VARIABLE_moduleName___Gateway {
  // TODO: Data fetch functions without knowing the source (API or Local)
  func addSomething(request: ___VARIABLE_moduleName___Request, completion: @escaping ___VARIABLE_moduleName___Result)
}