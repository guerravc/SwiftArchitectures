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

protocol AsyncResultUseCase {
  associatedtype Output

    func execute() async throws -> Output
}

protocol AsyncParameteredResultUseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) async throws -> Output
}

protocol AsyncParameteredVoidResultUseCase {
  associatedtype Input

  func execute(_ input: Input) async throws -> Void
}