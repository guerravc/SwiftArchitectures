// ___FILEHEADER___

import Observation
import Foundation

/// Contract for the ___VARIABLE_moduleName___ view model.
///
/// This protocol defines all presentation requirements the View relies on.
/// It allows mocking or replacing the view model in tests or previews.
@MainActor
protocol ___VARIABLE_moduleName___ViewModelProtocol: AnyObject {
    var title: String { get }
    var state: ___VARIABLE_moduleName___ViewModel.ViewState { get }

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
///
/// - ADR-004: `@MainActor` is applied for Swift 6 strict concurrency readiness.
///   While `@Observable` handles SwiftUI observation correctly without it in
///   Swift 5.9, strict concurrency checking requires explicit main-actor isolation
///   for types that mutate state observed by the UI.
@MainActor
@Observable
final class ___VARIABLE_moduleName___ViewModel: ___VARIABLE_moduleName___ViewModelProtocol {

    // MARK: - ViewState

    /// Represents the possible presentation states of the view.
    enum ViewState {
        /// Initial state before any data has been requested.
        case idle
        /// Data is being fetched.
        case loading
        /// Data was loaded successfully.
        case loaded([___VARIABLE_moduleName___Model])
        /// An error occurred while fetching data.
        case error(String)
    }

    // MARK: - Presentation State

    /// Title displayed in the navigation bar.
    var title: String = "___VARIABLE_moduleName___"

    /// Current presentation state of the view.
    var state: ViewState = .idle

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
        state = .loading

        do {
            try await Task.sleep(for: .seconds(1)) // Simulated delay

            let items: [___VARIABLE_moduleName___Model] = [
                .init(id: UUID(), title: "Item 1", subtitle: "Example A"),
                .init(id: UUID(), title: "Item 2", subtitle: "Example B"),
                .init(id: UUID(), title: "Item 3", subtitle: nil)
            ]

            state = .loaded(items)
        } catch is CancellationError {
            return
        } catch {
            state = .error("Unable to load data.")
        }
    }
}
