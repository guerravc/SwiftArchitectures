//___FILEHEADER___

import Foundation

protocol ___VARIABLE_ModuleName___Gateway {
    var remoteDataSource: ___VARIABLE_ModuleName___RemoteDataSource { get }
    var localDateSource: ___VARIABLE_ModuleName___LocalDataSource { get }
    
    init(remoteDataSource: ___VARIABLE_ModuleName___RemoteDataSource, localDataSource: ___VARIABLE_ModuleName___LocalDataSource)
    // TODO: Data fetch functions without knowing the source (API or Local)
}