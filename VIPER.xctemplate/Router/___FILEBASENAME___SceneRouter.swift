//___FILEHEADER___

import UIKit

class ___VARIABLE_sceneName___SceneRouter {
  
  weak var view: UIViewController?

  // MARK: Static methods
  static func createModule() -> UIViewController {
    let view = ___VARIABLE_sceneName___SceneViewController()
    let interactor = ___VARIABLE_sceneName___SceneInteractor()
    let router = ___VARIABLE_sceneName___SceneRouter()
    let presenter = ___VARIABLE_sceneName___ScenePresenter(interface: view, interactor: interactor, router: router)
    
    view.presenter = presenter
    interactor.presenter = presenter
    router.view = view
    
    return view
  }
  
}

extension ___VARIABLE_sceneName___SceneRouter: ___VARIABLE_sceneName___SceneWireframe  {

}