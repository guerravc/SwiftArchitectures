//___FILEHEADER___

import UIKit

class ___VARIABLE_sceneName___ScenePresenter {

  // MARK: Properties
  weak private var view: ___VARIABLE_sceneName___SceneViewProtocol?
  var interactor: ___VARIABLE_sceneName___SceneInteractorInput?
  private let router: ___VARIABLE_sceneName___SceneWireframe?

  init(interface: ___VARIABLE_sceneName___SceneViewProtocol,
    interactor: ___VARIABLE_sceneName___SceneInteractorInput?,
    router: ___VARIABLE_sceneName___SceneWireframe) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

extension ___VARIABLE_sceneName___ScenePresenter: ___VARIABLE_sceneName___ScenePresenterProtocol {

}

extension ___VARIABLE_sceneName___ScenePresenter: ___VARIABLE_sceneName___SceneInteractorOutput {

}