//___FILEHEADER___

import Foundation

// MARK: - View Output (Presenter -> View)
protocol ___VARIABLE_sceneName___SceneViewProtocol: AnyObject {
    var presenter: ___VARIABLE_sceneName___ScenePresenterProtocol? { get set}
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol ___VARIABLE_sceneName___SceneInteractorInput: AnyObject {
    var presenter: ___VARIABLE_sceneName___SceneInteractorOutput? { get set }
}

// MARK: - Router Input (Presenter -> Router)
protocol ___VARIABLE_sceneName___SceneWireframe: AnyObject {

}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol ___VARIABLE_sceneName___SceneInteractorOutput: AnyObject {
    
}

// MARK: - View Input (View -> Presenter)
protocol ___VARIABLE_sceneName___ScenePresenterProtocol: AnyObject {
    var interactor: ___VARIABLE_sceneName___SceneInteractorInput? { get set }
}