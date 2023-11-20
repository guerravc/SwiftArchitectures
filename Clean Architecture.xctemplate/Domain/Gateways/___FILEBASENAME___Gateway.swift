//___FILEHEADER___

import Foundation

typealias ___VARIABLE_moduleName___ResultClosure = (Result<___VARIABLE_moduleName___, Error>) -> Void

protocol ___VARIABLE_moduleName___Gateway {
  // TODO: Data fetch functions without knowing the source (API or Local)
  func addSomething(entityId: Int, completion: @escaping ___VARIABLE_moduleName___ResultClosure)
}