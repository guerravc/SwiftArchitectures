# SwiftArchitectures — Xcode Templates Repository

## Project Overview

SwiftArchitectures (Guerra's Concierge) is a curated suite of Xcode file templates that help bootstrap **production-ready architectures** for iOS projects. This repository contains `.xctemplate` folders that generate structured code following Clean Architecture, VIPER, MVVM, and other architectural patterns.

## Project Structure

- `*.xctemplate/` — Template directories (each contains `TemplateInfo.plist`, Swift files with Xcode variables, and optional assets)
  - `App Core.xctemplate/` — Foundational architecture layer (DI, Logging, AppInfo, base protocols)
  - `Clean Module.xctemplate/` — Complete Clean Architecture feature module
  - `MVVM Module.xctemplate/` — MVVM architecture module
  - `VIPER Module.xctemplate/` — VIPER scene for UIKit
  - `Networking.xctemplate/` — Reusable networking core
  - `Use Case.xctemplate/` — Focused use case implementations
- `Assets/` — Images and icons for templates
- `README.md` — Project documentation and installation instructions

## Template Structure

Each `.xctemplate` folder contains:
- `TemplateInfo.plist` — Metadata defining template options, platforms, allowed types, and behavior
- Swift source files with Xcode template variables:
  - `___FILEBASENAME___` — Base filename
  - `___VARIABLE_moduleName___` — Module name variable
  - `___VARIABLE_sceneName___` — Scene name variable
  - Other custom variables defined in `TemplateInfo.plist`
- `TemplateIcon.png` / `TemplateIcon@2x.png` — Template icons (optional)
- Directory structure matching the generated output

## Xcode Template Variables

Templates use Xcode's variable substitution system:
- `___FILEBASENAME___` — Replaced with the base filename (without extension)
- `___VARIABLE_<identifier>___` — Custom variables defined in `TemplateInfo.plist` Options array
- `___FILEHEADER___` — Replaced with file header comment (if configured)

## Conventions

- **Template Naming:** Templates appear under "Guerra's Concierge" section in Xcode
- **File Structure:** Each template generates a complete directory structure
- **Code Style:** Generated code follows Swift best practices and architectural patterns
- **Documentation:** Templates include inline documentation and usage examples

## Key Technologies

- Xcode File Templates (`.xctemplate` format)
- Swift 5.9+
- iOS 16+ minimum deployment target
- Swift Concurrency (for async templates)

## Installation

Templates are installed by copying `.xctemplate` folders to:
```
~/Library/Developer/Xcode/Templates/File Templates/Guerra's Concierge/
```

See `README.md` for detailed installation and usage instructions.
