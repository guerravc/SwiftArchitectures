//___FILEHEADER___

import Foundation

// MARK: Use Case
struct Get___VARIABLE_moduleName___UseCase: ParameteredResultUseCase {
    #warning("This is only an example must be adapt")
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
        fatalError("This class needs to implemented the correct escaping closure.")
        // TODO: Call gateways methods
    }
}