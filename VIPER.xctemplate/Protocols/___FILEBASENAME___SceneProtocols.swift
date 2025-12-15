//___FILEHEADER___

import Foundation

// MARK: - View (Presenter -> View)

/// Protocol defining the interface of the view for the
/// `___VARIABLE_sceneName___` scene.
/// The presenter uses this protocol to instruct the view to update its UI.
protocol ___VARIABLE_sceneName___SceneViewProtocol: AnyObject {
  /// Presenter responsible for handling user interactions and view lifecycle events.
  var presenter: ___VARIABLE_sceneName___ScenePresenterProtocol? { get set }
}

// MARK: - Interactor Input (Presenter -> Interactor)

/// Protocol defining the input methods of the interactor for the
/// `___VARIABLE_sceneName___` scene.
/// The presenter uses this protocol to request business logic operations.
protocol ___VARIABLE_sceneName___SceneInteractorInput: AnyObject {
  /// Output channel used by the interactor to communicate results back to the presenter.
  var presenter: ___VARIABLE_sceneName___SceneInteractorOutput? { get set }
}

// MARK: - Router Input (Presenter -> Router)

/// Protocol defining the navigation responsibilities for the
/// `___VARIABLE_sceneName___` scene.
/// The presenter uses this protocol to trigger navigation flows.
protocol ___VARIABLE_sceneName___SceneWireframe: AnyObject { }

// MARK: - Interactor Output (Interactor -> Presenter)

/// Protocol defining the output methods of the interactor for the
/// `___VARIABLE_sceneName___` scene.
/// The interactor uses this protocol to notify the presenter about operation results.
protocol ___VARIABLE_sceneName___SceneInteractorOutput: AnyObject { }

// MARK: - Presenter (View -> Presenter)

/// Protocol defining the interface of the presenter for the
/// `___VARIABLE_sceneName___` scene.
/// The view uses this protocol to notify about lifecycle events and user interactions.
protocol ___VARIABLE_sceneName___ScenePresenterProtocol: AnyObject {
  /// Interactor responsible for handling business logic for the scene.
  var interactor: ___VARIABLE_sceneName___SceneInteractorInput? { get set }
}