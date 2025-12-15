//___FILEHEADER___
import UIKit

/// Root view for the `___VARIABLE_sceneName___SceneViewController`.
/// Use this view to configure the UI elements and layout for the scene.
final class ___VARIABLE_sceneName___SceneView: UIView {
  // MARK: - Subviews
  
  // Add subview properties here.
  
  // MARK: - Initializers
  
  /// Creates a new instance of the scene view with the given frame.
  /// - Parameter frame: The initial frame rectangle for the view.
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  /// Creates a new instance of the scene view with a zero frame.
  convenience init() {
    self.init(frame: .zero)
  }
  
  /// Creates a new instance of the scene view from a decoder.
  /// - Parameter coder: The decoder to use when instantiating the view.
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  /// Performs common setup for the scene view.
  /// Configures the view hierarchy and layout constraints.
  private func setupView() {
    addViews()
    setupConstraints()
  }
}