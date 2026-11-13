// ___FILEHEADER___

import SwiftUI

/// Root SwiftUI view for the ___VARIABLE_moduleName___ module.
///
/// This view owns the lifecycle of the view model using a `@State` property.
/// It renders different states (loading, error, empty, content) based on the
/// view model's `ViewState`.
struct ___VARIABLE_moduleName___View<ViewModel: ___VARIABLE_moduleName___ViewModelProtocol>: View {

    // MARK: - State

    /// View model driving the presentation logic for this module.
    ///
    /// The view owns the view model instance by storing it in `@State`.
    /// Inject another type that conforms to the protocol for previews or tests.
    /// That type should be `@Observable` if the preview needs live updates.
    @State private var viewModel: ViewModel

    // MARK: - Initializers

    /// Creates the view and a new view model on the main actor.
    @MainActor
    init() where ViewModel == ___VARIABLE_moduleName___ViewModel {
        self.init(viewModel: ___VARIABLE_moduleName___ViewModel())
    }

    /// Creates the view with the given view model.
    ///
    /// - Parameter viewModel: Any type conforming to the view model protocol,
    ///   useful for previews or tests.
    @MainActor
    init(viewModel: ViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    // MARK: - View

    /// Main view hierarchy for the module.
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    loadingView
                case .loaded(let items) where items.isEmpty:
                    emptyView
                case .loaded(let items):
                    contentView(items: items)
                case .error(let message):
                    errorView(message: message)
                }
            }
            .navigationTitle(viewModel.title)
        }
        .task {
            await viewModel.onAppear()
        }
    }

    // MARK: - Subviews

    /// View displayed while the data is being loaded.
    private var loadingView: some View {
        VStack(spacing: 16) {
            ProgressView()
            Text("Loading...")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    /// View displayed when an error occurs.
    ///
    /// - Parameter message: Error description to show to the user.
    private func errorView(message: String) -> some View {
        VStack(spacing: 12) {
            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Button(action: {
                Task {
                    await viewModel.reload()
                }
            }) {
                Text("Retry")
                    .font(.body.weight(.semibold))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.primary)
    }

    /// View displayed when there is no data to show.
    private var emptyView: some View {
        VStack(spacing: 8) {
            Text("No data available")
                .font(.body)
            Text("Try again later or pull to refresh.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    /// Main content view when there is data available.
    private func contentView(items: [___VARIABLE_moduleName___Model]) -> some View {
        List(items) { item in
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                if let subtitle = item.subtitle, !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.vertical, 4)
        }
        .listStyle(.plain)
        .refreshable {
            await viewModel.reload()
        }
    }
}

// MARK: - Preview

#Preview {
    ___VARIABLE_moduleName___View()
}
