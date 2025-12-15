//___FILEHEADER___
import UIKit

/// View controller for the `___VARIABLE_sceneName___` scene.
/// Responsible for managing the view lifecycle and delegating user events to the presenter.
final class ___VARIABLE_sceneName___SceneViewController: UIViewController {
  // MARK: - Properties
  
  /// Presenter responsible for handling user interactions and coordinating the scene logic.
  var presenter: ___VARIABLE_sceneName___ScenePresenterProtocol?
  
  // MARK: - Lifecycle
  
  /// Loads the view for the view controller.
  /// Replaces the default view with an instance of `___VARIABLE_sceneName___SceneView`.
  override func loadView() {
    view = ___VARIABLE_sceneName___SceneView()
  }
  
  /// Called after the controller's view is loaded into memory.
  /// Use this method to perform additional setup, such as configuring gestures.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupGestures()
    // Trigger any initial presenter actions here if needed.
  }
  
  // MARK: - Setup
  
  /// Configures gesture recognizers for the scene view.
  /// Add and configure all gesture recognizers in this method.
  private func setupGestures() {
    // Configure gesture recognizers here.
  }
}

// MARK: - ___VARIABLE_sceneName___SceneViewProtocol

/// Conformance to the view protocol for the `___VARIABLE_sceneName___` scene.
/// Implement view update methods in this extension.
extension ___VARIABLE_sceneName___SceneViewController: ___VARIABLE_sceneName___SceneViewProtocol {
  // TODO: Implement view protocol methods.
}