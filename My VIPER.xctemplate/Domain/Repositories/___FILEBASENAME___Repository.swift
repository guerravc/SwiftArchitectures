
//___FILEHEADER___

import Foundation

struct ___VARIABLE_ModuleName___Repository: ___VARIABLE_ModuleName___Gateway {


    var remoteDataSource: ___VARIABLE_ModuleName___RemoteDataSource
    var localDateSource: ___VARIABLE_ModuleName___LocalDataSource
    
    init(remoteDataSource: ___VARIABLE_ModuleName___RemoteDataSource, localDataSource: ___VARIABLE_ModuleName___LocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDateSource = localDataSource
    }
    
    // Data fetch service methods goes here

}
