//___FILEHEADER___

import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()
    
    private var dispatcher: ___VARIABLE_moduleName___APIRequestDispatcher {
        ___VARIABLE_moduleName___APIRequestDispatcher.shared
    }
    private var remoteDataSource: ___VARIABLE_moduleName___RemoteDataSource {
        ___VARIABLE_moduleName___Service.shared
    }
    private var localDataSource: ___VARIABLE_moduleName___LocalDataSource {
        ___VARIABLE_moduleName___Storage.shared
    }
    private var gateway: ___VARIABLE_moduleName___Gateway {
        ___VARIABLE_moduleName___Repository.make()
    }
    
    private init() {
    }
}

extension DependencyContainer {
    func resolve<T>(_ type: T.Type) -> T? {
        switch type {
        case is ___VARIABLE_moduleName___RemoteDataSource.Protocol:
            return remoteDataSource as? T
        case is ___VARIABLE_moduleName___LocalDataSource.Protocol:
            return localDataSource as? T
        case is ___VARIABLE_moduleName___APIRequestDispatcher.Type:
            return dispatcher as? T
        case is ___VARIABLE_moduleName___Gateway.Protocol:
            return gateway as? T
        default:
            return nil
        }
    }
}