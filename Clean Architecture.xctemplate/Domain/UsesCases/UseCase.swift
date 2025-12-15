//___FILEHEADER___

import Foundation

protocol UseCase {
  func execute()
}

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

protocol AsyncUseCase {
    func execute() async
}

protocol AsyncResultUseCase {
  associatedtype Output

    func execute() async -> Result<Output, Error>
}

protocol AsyncParameteredResultUseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) async -> Result<Output, Error>
}

protocol AsyncParameteredVoidResultUseCase {
  associatedtype Input

  func execute(_ input: Input) async
}