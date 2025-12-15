//___FILEHEADER___

import UIKit

/// Router for the `___VARIABLE_sceneName___` scene.
/// Responsible for creating the module and handling navigation.
final class ___VARIABLE_sceneName___SceneRouter {
  // MARK: - Properties
  
  /// Weak reference to the scene's view controller used for navigation operations.
  weak var view: UIViewController?
  
  // MARK: - Module creation
  
  /// Creates and wires up the VIPER module for the `___VARIABLE_sceneName___` scene.
  /// - Returns: A fully configured view controller instance for the scene.
  static func createModule() -> UIViewController {
    let viewController = ___VARIABLE_sceneName___SceneViewController()
    let interactor = ___VARIABLE_sceneName___SceneInteractor()
    let router = ___VARIABLE_sceneName___SceneRouter()
    let presenter = ___VARIABLE_sceneName___ScenePresenter(
      view: viewController,
      interactor: interactor,
      router: router
    )
    
    viewController.presenter = presenter
    interactor.presenter = presenter
    router.view = viewController
    
    return viewController
  }
}

// MARK: - ___VARIABLE_sceneName___SceneWireframe

/// Conformance to the wireframe protocol for the `___VARIABLE_sceneName___` scene.
/// Implement navigation-related methods for the scene in this extension.
extension ___VARIABLE_sceneName___SceneRouter: ___VARIABLE_sceneName___SceneWireframe { }