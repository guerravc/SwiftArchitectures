// ___FILEHEADER___

import Observation
import Foundation

/// Contract for the ___VARIABLE_moduleName___ view model.
///
/// This protocol defines all presentation requirements the View relies on.
/// It allows mocking or replacing the view model in tests or previews.
protocol ___VARIABLE_moduleName___ViewModelProtocol: AnyObject {
    var title: String { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    var items: [___VARIABLE_moduleName___Model] { get }

    func onAppear() async
    func reload() async
}

/// Default `@Observable` implementation of the module's view model.
///
/// This type manages loading state, errors, and data presentation
/// for the `___VARIABLE_moduleName___View`.
///
/// Replace the stubbed async calls with real logic depending on
/// your project's architecture (Clean, Networking, Services, etc.).
@Observable
final class ___VARIABLE_moduleName___ViewModel: ___VARIABLE_moduleName___ViewModelProtocol {

    // MARK: - Presentation State

    /// Title displayed in the navigation bar.
    var title: String = "___VARIABLE_moduleName___"

    /// Indicates whether the view is currently loading data.
    var isLoading: Bool = false

    /// Keeps the latest error message (if any).
    var errorMessage: String?

    /// Items displayed by the view.
    var items: [___VARIABLE_moduleName___Model] = []

    // MARK: - Init

    init() { }

    // MARK: - Public Methods

    /// Called when the view appears for the first time.
    func onAppear() async {
        await loadData()
    }

    /// Reloads the data on user demand (pull-to-refresh or retry).
    func reload() async {
        await loadData()
    }

    // MARK: - Private Helpers

    /// Simulates an async load operation.
    ///
    /// Replace this placeholder with your actual logic:
    /// - calling a service
    /// - interacting with a use case
    /// - using the networking core
    private func loadData() async {
        isLoading = true
        errorMessage = nil

        do {
            try await Task.sleep(for: .seconds(1)) // Simulated delay

            // Example mock data
            items = [
                .init(id: UUID(), title: "Item 1", subtitle: "Example A"),
                .init(id: UUID(), title: "Item 2", subtitle: "Example B"),
                .init(id: UUID(), title: "Item 3", subtitle: nil)
            ]

        } catch {
            errorMessage = "Unable to load data."
        }

        isLoading = false
    }
}