//___FILEHEADER___
import UIKit

class ___VARIABLE_ModuleName___ViewController: UIViewController {
    
    private let views: ___VARIABLE_ModuleName___Views = ___VARIABLE_ModuleName___Views()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        // First load the view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Second Call the services
    }

    // MARK: - Properties
    var presenter: ViewToPresenter___VARIABLE_ModuleName___Protocol?
}

extension ___VARIABLE_ModuleName___ViewController: PresenterToView___VARIABLE_ModuleName___Protocol{
    // TODO: Implement View Output Methods
}
