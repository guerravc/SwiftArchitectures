//___FILEHEADER___

import Foundation

protocol ResultUseCase {
  associatedtype Output

  func execute(completion: @escaping (Result<Output, Error>) -> Void)
}

protocol ParameteredResultUseCase {
  associatedtype Input
  associatedtype Output

  func execute(
    _ input: Input,
    completion: @escaping (Result<Output, Error>) -> Void)
}

protocol ParameteredVoidResultUseCase {
  associatedtype Input

  func execute(
    _ input: Input,
    completion: @escaping (Result<Void, Error>) -> Void)
}

protocol ParameteredAsyncResultUseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) async throws -> Output
}