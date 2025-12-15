//___FILEHEADER___

import Foundation

/// Presenter for the `___VARIABLE_sceneName___` scene.
/// Coordinates interactions between the view, interactor, and router.
final class ___VARIABLE_sceneName___ScenePresenter {
  // MARK: - Properties
  
  /// View responsible for rendering the UI of the scene.
  private weak var view: ___VARIABLE_sceneName___SceneViewProtocol?
  
  /// Interactor responsible for executing the business logic of the scene.
  var interactor: ___VARIABLE_sceneName___SceneInteractorInput?
  
  /// Router responsible for handling navigation related to the scene.
  private let router: ___VARIABLE_sceneName___SceneWireframe
  
  // MARK: - Initializers
  
  /// Creates a new instance of the scene presenter.
  /// - Parameters:
  ///   - view: The view used to render the scene UI.
  ///   - interactor: The interactor used to perform business logic.
  ///   - router: The router used to manage navigation for the scene.
  init(
    view: ___VARIABLE_sceneName___SceneViewProtocol,
    interactor: ___VARIABLE_sceneName___SceneInteractorInput?,
    router: ___VARIABLE_sceneName___SceneWireframe
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - ___VARIABLE_sceneName___ScenePresenterProtocol

/// Conformance to the presenter protocol for the `___VARIABLE_sceneName___` scene.
/// Implement presenter input methods invoked by the view in this extension.
extension ___VARIABLE_sceneName___ScenePresenter: ___VARIABLE_sceneName___ScenePresenterProtocol { }

// MARK: - ___VARIABLE_sceneName___SceneInteractorOutput

/// Conformance to the interactor output protocol for the `___VARIABLE_sceneName___` scene.
/// Implement methods invoked by the interactor to deliver results back to the presenter.
extension ___VARIABLE_sceneName___ScenePresenter: ___VARIABLE_sceneName___SceneInteractorOutput { }