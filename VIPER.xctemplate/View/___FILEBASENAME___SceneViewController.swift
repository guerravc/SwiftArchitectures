//___FILEHEADER___
import UIKit

class ___VARIABLE_sceneName___SceneViewController: UIViewController {

  // MARK: - Properties
  var presenter: ___VARIABLE_sceneName___ScenePresenterProtocol?
  
  // MARK: - Lifecycle Methods
  override func loadView() {
    super.loadView()
    // First load the view
    let view = ___VARIABLE_sceneName___SceneView()
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupGestures()
    // Second Call the services
  }

  private func setupGestures() {
    
  }
}

extension ___VARIABLE_sceneName___SceneViewController: ___VARIABLE_sceneName___SceneViewProtocol{
  // TODO: Implement View Output Methods
}