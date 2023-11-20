//___FILEHEADER___

import Foundation

// MARK: Use Case
struct Get___VARIABLE_moduleName___UseCase: ParameteredResultUseCase {
  struct Input {
    // FIXME: Use the correct input for your use case
    let id: Int
    
    init(id: Int) {
      self.id = id
    }
  }
  
  private let gateway: ___VARIABLE_moduleName___Gateway
  
  public init(gateway: ___VARIABLE_moduleName___Gateway) {
    self.gateway = gateway
  }
  
  public func execute(_ input: Input, completion: @escaping ___VARIABLE_moduleName___ResultClosure) {
    gateway.addSomething(entityId: input.id, completion: completion)
  }
}