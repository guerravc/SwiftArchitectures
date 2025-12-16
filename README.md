![header](Assets/Header.jpeg)

# Guerra's Concierge — Swift Architecture Templates

Guerra's Concierge is a curated suite of Xcode file templates that help you
bootstrap **production-ready architectures** for iOS projects.

It currently includes templates for:

- **App Core**
- **Clean Module**
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
- `Data/Protocols/___VARIABLE_moduleName___DataSourceProtocol.swift`
- `Data/Services/Default___VARIABLE_moduleName___Service.swift`
- `Data/PersistentStorages/Default___VARIABLE_moduleName___Storage.swift`
- `Data/Repositories/Default___VARIABLE_moduleName___Repository.swift`
- `Data/Models/BaseResponses.swift`
- `Data/API/___VARIABLE_moduleName___API.swift`

The template gives you a ready-to-use skeleton that cleanly separates **Domain** and
**Data** using a well-defined gateway boundary.

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

Designed to be used as a **single networking layer** across multiple Clean or VIPER modules.

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
3. Choose the template you want (App Core, Clean Module, Networking, Use Case, VIPER Module).
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

## Requirements

- Xcode 14+  
- iOS 16+  
- Swift Concurrency support (for async templates)

---

## License

Released under the MIT License. See `LICENSE` for details.
