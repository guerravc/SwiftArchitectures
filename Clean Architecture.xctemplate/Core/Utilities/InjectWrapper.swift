//___FILEHEADER___

import Foundation

@propertyWrapper
struct Inject<T> {
    private var service: T
    
    init() {
        let dependency = DependencyContainer.shared
        self.service = dependency.resolve(T.self)!
    }
    
    var wrappedValue: T {
        get { service }
        mutating set { service = newValue }
    }
}