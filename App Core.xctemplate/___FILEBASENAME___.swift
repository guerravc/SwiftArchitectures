// ___FILEHEADER___

import Foundation

/// Entry file for the generated App Core.
/// 
/// This file exists only to anchor template generation and to help developers
/// understand where the root of the App Core lives. You may safely delete it
/// after installation.
///
/// The App Core template installs:
///
/// - `Core/AppInfo/AppInfo.swift`
///     Provides metadata about the application and OS.
///
/// - `Core/DI/DependencyContainer.swift`
///     A lightweight dependency injection container.
///
/// - `Core/DI/DIWrappers.swift`
///     `@Inject` and `@Provider` property wrappers used for dependency injection.
///
/// - `Core/Logging/Log.swift`
///     Multi-level logging utility.
///
/// - `Domain/Protocols/UseCaseProtocol.swift`
///     Base protocols for use cases.
///
///
/// ## Usage
///
/// After installing App Core, you may:
///
/// - Register dependencies using `@Provider`
/// - Resolve dependencies using `@Inject`
/// - Use the DI container manually if needed
/// - Extend App Core by adding more domain protocols or utilities
///
///
/// ## Deleting this File
///
/// This file is not used at runtime.
/// It is safe to delete it once you understand the structure of the template.
struct ___FILEBASENAME___ { }