# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

SwiftArchitectures (branded **Guerra's Concierge**) is a suite of Xcode **file templates** (`.xctemplate`), not an app or a Swift package. There is no `Package.swift`, Xcode project, test target, linter config, or CI. The Swift in this tree is substituted by Xcode and then compiled inside a consumer app. Do not invent `xcodebuild`, SwiftPM, or test commands.

Conversation and explanations: Spanish. Code, identifiers, filenames, docstrings, and commit messages: English.

## Install and validate

Copy the `.xctemplate` directories into:

```text
~/Library/Developer/Xcode/Templates/File Templates/Guerra's Concierge/
```

Restart Xcode. They appear under **Guerra's Concierge** (File → New → File…).

There is no automated test suite. After a template edit, check only what this repo can actually check:

- `plutil -lint "<Name>.xctemplate/TemplateInfo.plist"` for each plist you touch.
- Every `___VARIABLE_<identifier>___` in Swift or storyboard files must have an `Options` entry whose `Identifier` is `<identifier>`. `___FILEBASENAME___` and `___FILEHEADER___` are built-in; do not add them to `Options`.
- `Kind` stays `Xcode.IDEKit.TextSubstitutionFileTemplateKind`. `Platforms` stays `com.apple.platform.iphoneos`.
- Text-substitution templates have **no conditional logic** and almost no variable manipulation. If a request needs branching, say so and propose the closest static alternative.
- The only end-to-end check is generating the template in Xcode. Say so when you have not done that.

`README.html` is gitignored. `README.md` points at a `LICENSE` file that is not in the tree.

## How the templates fit together

Install **App Core once** per app, then **Networking once**, then feature templates as needed.

```text
Use Case ─────────► App Core (use-case protocols)
Clean Module ─────► App Core (BaseResponse, ErrorResponse, Log, use-case protocols)
Networking ───────► App Core (shared types; response envelopes do not live here)
MVVM / VIPER        presentation skeletons; they do not import the other templates
```

- **App Core** — shared foundation: `DependencyContainer` (custom, `OSAllocatedUnfairLock`, not Swinject), `Log`, `AppInfo`, crypto wrappers, and eight use-case protocols (`Action` / `Query` / `Command` / `Operation`, each sync and `Async*`). Sync variants take a completion handler. Async variants return `Result` and do not throw.
- **Networking** — one URLSession stack: `APIRouter` → request builder → `APIRequestDispatcher` → `APIClient` (`request`, `requestData`, SSE `stream` as `AsyncStream`). Failures here are `NetworkError`, not domain errors.
- **Clean Module** — Domain and Data only, no UI. The use case talks to `___VARIABLE_moduleName___Gateway`. `Default*Repository` implements that gateway: it interprets the `BaseResponse` envelope (`isSuccessful` is status `0` or HTTP 2xx), maps DTO → entity, and caches through the local data source. Infrastructure failures stay in the data layer (`*RepositoryError`).
- **Use Case** — emits all eight protocol + `UCImpl` variants, each holding a gateway and producing or accepting an entity. The consumer deletes the variants they do not need. The name is `VerbEntity` (for example `FetchPayroll`).
- **MVVM Module** — SwiftUI. The view model is `@Observable` and `@MainActor`, with an explicit `ViewState`. Async methods are stubs until the consumer wires a use case or service.
- **VIPER Module** — UIKit scene. Protocols live in one file; navigation stays in the router. Includes a storyboard.

`BaseResponse`, `EmptyBaseResponse`, and `ErrorResponse` live in App Core on purpose (ADR-003), so Clean Module and Use Case do not depend on Networking.

## Template mechanics that are easy to get wrong

- A template directory **is** the product. Its on-disk layout is the generated layout. `___FILEBASENAME___` in a path becomes the name Xcode assigns from `productName`.
- Feature templates set `productName` to a **static** option whose default is another variable (`___VARIABLE_moduleName___` or `___VARIABLE_sceneName___`). That is how the generated root folder follows the user's input. Do not replace it with a hardcoded string.
- Clean and MVVM user input is `moduleName`. VIPER user input is `sceneName`; view controller, interactor, presenter, entity, and router names are static options derived from it. Use Case user input is `fileName`, `entityName`, and `gatewayName`. Use Case **filenames** embed `___VARIABLE_fileName___` directly, not `___FILEBASENAME___`.
- `MainTemplateFile` omits the `.swift` extension. Only Use Case and VIPER set `AllowedTypes` and `MainTemplateFile`. App Core, Networking, Clean, and MVVM omit them and still ship. Do not normalize plists unless the change requires those keys. Do not re-add `DefaultCompletionName` to Clean or MVVM; it was removed so the completion name follows `productName`.
- Keep `___VARIABLE_*___` tokens intact. A Swift file that drops the token will not substitute.
- Do not edit an unrelated `.xctemplate` while changing another.
- Inline docs in generated Swift stay in English. Comment tags `ADR-001` … `ADR-004` match **Architecture Decisions** in `README.md`. Do not reopen them unless asked: `Log.warning` maps to `Logger.notice`; log identity requires `AnyObject`; response models stay in App Core; MVVM view models stay `@MainActor`.

## Rules that apply here

`.cursor/rules/base.mdc` and `.cursor/rules/output-contract.mdc` match this repo. When a response changes templates, include the full file (not a partial snippet), validate `TemplateInfo.plist`, and offer one commit subject:

```text
[BUILD] | [CI] | [DOCS] | [FEAT] | [FIX] | [PERF] | [REFACTOR] | [STYLE] | [TEST]: …
```

`.cursor/rules/planning.mdc`, `review.mdc`, `integration.mdc`, `qa.mdc`, and `debug.mdc` describe another product (RDSUI, RDSNetworking, MobileMax, Swinject, `Docs/STYLEGUIDE.md`, `~/.cursor/issues`). Those packages and that style guide are **not in this repository**. Do not treat them as constraints here.

`AGENTS.md` is the short overview. Prefer the template tree over `README.md` when they disagree: the README contents list omits **MVVM Module**, and its Clean Module paths (`Data/Protocols`, `Data/Models/BaseResponses.swift`) do not match the tree (`Data/DataSource/…`; response models exist only in App Core).
