![header](Assets/Header.jpeg)

# Guerra's Concierge — Swift Architecture Templates

Guerra's Concierge is a curated suite of Xcode file templates that help you
bootstrap **production-ready architectures** for iOS projects.

It currently includes templates for:

- **App Core**
- **Clean Module**
- **MVVM Module**
- **Networking**
- **Use Case**
- **VIPER Module**

All templates appear under the **“Guerra's Concierge”** section when creating a
new file in Xcode.

---

## Contents

### App Core

Base layer for your application:

- Dependency injection helpers  
- Logging utilities  
- `AppInfo` helpers for configuration  
- Base use case protocols  
- Shared core types (e.g. `BaseResponse`, `EmptyBaseResponse`)  

Intended to be added **once per app** and shared across all modules.

---

### Clean Module

Generates a complete **Clean Architecture** feature module, including:

- `Domain/Entities/___VARIABLE_moduleName___Entity.swift`
- `Domain/Gateways/___VARIABLE_moduleName___Gateway.swift`
- `Domain/UseCases/Fetch___VARIABLE_moduleName___UC.swift`
- `Data/Models/___VARIABLE_moduleName___DTO.swift`
- `Data/Protocols/___VARIABLE_moduleName___DataSourceProtocol.swift`
- `Data/Services/Default___VARIABLE_moduleName___Service.swift`
- `Data/PersistentStorages/Default___VARIABLE_moduleName___Storage.swift`
- `Data/Repositories/Default___VARIABLE_moduleName___Repository.swift`
- `Data/Models/BaseResponses.swift`
- `Data/API/___VARIABLE_moduleName___API.swift`

The template gives you a ready-to-use skeleton that cleanly separates **Domain** and
**Data** using a well-defined gateway boundary.

---

### MVVM Module

Generates a **SwiftUI MVVM** feature module:

- `Model/___VARIABLE_moduleName___Model.swift`
- `View/___VARIABLE_moduleName___View.swift`
- `ViewModel/___VARIABLE_moduleName___ViewModel.swift`

The view model is `@Observable` and `@MainActor`, with an explicit `ViewState`.
Async methods are stubs until you wire a use case or service.

---

### Networking

Provides a reusable **networking core**, including:

- HTTP primitives (`HTTPMethod`, `HTTPStatusCode`, `NetworkError`)  
- `APIVersion`, `HTTPConfiguration`, and global `API` config  
- `APIRouter` protocol  
- `APIRequest` / `APIRequestBuilder`  
- `APIResponse`  
- `APIRequestDispatcher` (async/await, URLSession-based)  
- `APIClient` with decoding and optional streaming  
- SSE support using AsyncStream  

Designed to be used as a **single networking layer** across multiple Clean, MVVM, or VIPER modules.

---

### Use Case

Generates **focused use case implementations** conforming to the shared protocols in App Core.

Available flavors include:

- `ActionUseCase` / `AsyncActionUseCase`
- `QueryUseCase` / `AsyncQueryUseCase`
- `CommandUseCase` / `AsyncCommandUseCase`
- `OperationUseCase` / `AsyncOperationUseCase`

Each file provides a protocol + implementation pattern with a dedicated `UCImpl`,
ready to receive a gateway and work directly with domain entities.

---

### VIPER Module

Generates a complete **VIPER scene** for UIKit:

- `View`
- `ViewController`
- `Interactor`
- `Presenter`
- `Entity`
- `Router`
- `Protocols`
- Optional Storyboard

Dependencies are wired through the router factory, keeping navigation isolated
and the architecture modular.

---

## Installation

1. **Download or clone** this repository.
2. Inside the repo you will find:

   - `App Core.xctemplate`
   - `Clean Module.xctemplate`
   - `MVVM Module.xctemplate`
   - `Networking.xctemplate`
   - `Use Case.xctemplate`
   - `VIPER Module.xctemplate`

3. Open Finder and go to (⌘ + ⇧ + G):

   ```text
   ~/Library/Developer/Xcode/Templates/File Templates/
   ```

4. Create a folder (if missing):

   ```text
   Guerra's Concierge
   ```

5. Copy the `.xctemplate` folders you want inside that folder.

6. **Restart Xcode**.

After restarting, the templates will appear under **“Guerra's Concierge”** in the file creation dialog.

---

## Usage

1. In Xcode, go to **File → New → File…**
2. Scroll to the **Guerra's Concierge** section.
3. Choose the template you want (App Core, Clean Module, MVVM Module, Networking, Use Case, VIPER Module).
4. Click **Next** and fill in the required parameters.
5. Xcode will generate the files automatically.

![guerra-concierge](Assets/SSGuerraConcierge.png)

---

## Philosophy

These templates aim to:

- Encourage **explicit architectures** over ad-hoc code  
- Reduce **boilerplate** when bootstrapping new modules  
- Provide **clean, testable boundaries** between Domain and Data  
- Make onboarding **new iOS developers** easier  

They are intentionally **opinionated** but designed to be extended and customized.

---

## Architecture Decisions

This section documents key design choices that have been evaluated and confirmed.
Its purpose is to prevent future audits (human or automated) from re-raising
resolved concerns. Each entry includes a short rationale and a reference tag
used in inline code comments (e.g. `ADR-001`).

### ADR-001 — `Logger.notice` as warning level

OSLog (`Logger`) does not expose a `.warning` level. The closest semantic
equivalent is `.notice`, which is persisted by default and visible in
Console.app without enabling debug-level logging. The public API of `Log`
exposes `Log.warning(...)` for clarity while using `logger.notice` internally.

### ADR-002 — `AnyObject` for identity tracking in Log

The `instance` parameter in every `Log` method requires a reference type
(`AnyObject`) so that `Unmanaged.passUnretained(_:).toOpaque()` can derive
the object's memory address. This address is printed as `selfId` in each log
line, enabling cross-thread identity tracking without requiring conformance
to `Hashable` or `Identifiable`.

### ADR-003 — Response models in App Core (not Networking)

`BaseResponse`, `EmptyBaseResponse`, and `ErrorResponse` live in the App Core
template instead of the Networking template. This allows the Use Case and Clean
Module templates to depend solely on App Core without pulling in the full
Networking stack, keeping the dependency graph shallow:

```
Clean Module ──> App Core
                   (contains BaseResponse, ErrorResponse)
Networking ────> App Core
```

### ADR-005 — App Core infrastructure is `nonisolated`

New Xcode projects set `SWIFT_DEFAULT_ACTOR_ISOLATION` to `MainActor` and enable approachable concurrency. Under that default, a synthesized `Decodable` or `Hashable` conformance is main-actor isolated. That conformance cannot satisfy a `Sendable` generic requirement (`BaseResponse<EmptyResponseBody>` does not compile) and cannot be used inside `OSAllocatedUnfairLock` (`ServiceKey`; an error in the Swift 6 language mode).

App Core is a shared foundation, not UI. Response models, `DependencyContainer`, `Log`, `AppInfo`, the crypto types, and the `KeyedDecodingContainer` helpers are marked `nonisolated` so decoding, logging, and the lock stay usable off the main actor. `nonisolated` on a type is a no-op when the project has no default actor isolation, so older projects still compile.

`CancellableTask`, `Inject`, and `Provider` keep the project's default isolation. `CancellableTask` is documented for `@MainActor` view models. The use-case protocols are unmarked so they follow the consumer project's isolation instead of forcing every use case off the main actor.

### ADR-004 — `@MainActor` on MVVM ViewModels

The `@Observable` macro handles UI observation correctly in SwiftUI even
without `@MainActor`. However, Swift 6 strict concurrency checking will emit
warnings for observable classes that mutate published state without explicit
main-actor isolation. `@MainActor` is applied proactively to ensure the
templates are Swift 6–ready out of the box.

---

## Requirements

- Xcode 14+  
- iOS 16+  
- Swift Concurrency support (for async templates)

---

## License

Released under the MIT License. See `LICENSE` for details.
