//___FILEHEADER___

import Foundation

// MARK: Use Case
struct Get___VARIABLE_moduleName___UseCase: ParameteredResultUseCase {
  struct Input {
    // FIXME: Use the correct input for your use case
    let id: ___VARIABLE_moduleName___
  }
  
  @Inject private let gateway: ___VARIABLE_moduleName___Gateway
  
  public init() {}
  
  public func execute(_ input: Input, completion: @escaping ___VARIABLE_moduleName___Result) {
    let request: ___VARIABLE_moduleName___Request = .init(input: input.id)
    gateway.addSomething(request: request, completion: completion)
  }
}