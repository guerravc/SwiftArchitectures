
//___FILEHEADER___

import Foundation

final class ___VARIABLE_moduleName___Repository: ___VARIABLE_moduleName___Gateway {


    private let remoteDataSource: ___VARIABLE_moduleName___RemoteDataSource
    private let localDateSource: ___VARIABLE_moduleName___LocalDataSource
    
    private init(remoteDataSource: ___VARIABLE_moduleName___RemoteDataSource, localDataSource: ___VARIABLE_moduleName___LocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDateSource = localDataSource
    }

    static func make(remoteService: ___VARIABLE_moduleName___RemoteDataSource,
                    localStorage: ___VARIABLE_moduleName___LocalDataSource = ___VARIABLE_moduleName___Storage.shared) -> ___VARIABLE_moduleName___Gateway {
      ___VARIABLE_moduleName___Repository(remoteDataSource: remoteService, localDataSource: localStorage)
    }
    
    // Data fetch service methods goes here

}
