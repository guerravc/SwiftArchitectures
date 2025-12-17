// ___FILEHEADER___

import Foundation
import OSLog

/// A lightweight logging utility for the application.
/// Provides log output categorized by severity levels.
/// In DEBUG builds, all log levels are emitted.
/// In RELEASE builds, only warnings and errors are emitted.
public enum Log {

  // MARK: - Logger

  /// Shared OSLog logger instance used by all log outputs.
  ///
  /// - Note: The subsystem uses the main bundle identifier when available,
  ///   so logs can be easily filtered in Console.app.
  private static let logger = Logger(
    subsystem: Bundle.main.bundleIdentifier ?? "App",
    category: "Log"
  )

  // MARK: - Public API

  /// Logs a debug-level message. Emitted only in DEBUG builds.
  ///
  /// - Parameters:
  ///   - message: The message to log.
  ///   - file: The file name where the log originates.
  ///   - function: The function name where the log originates.
  ///   - line: The line number where the log originates.
  public static func debug(
    _ message: String,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    #if DEBUG
    let formatted = format(
      level: "🐛 DEBUG",
      message: message,
      file: file,
      function: function,
      line: line
    )
    logger.debug("\(formatted, privacy: .public)")
    #endif
  }

  /// Logs an informational message.
  /// Emitted in DEBUG builds. Suppressed in RELEASE builds.
  ///
  /// - Parameters:
  ///   - message: The message to log.
  ///   - file: The file name where the log originates.
  ///   - function: The function name where the log originates.
  ///   - line: The line number where the log originates.
  public static func info(
    _ message: String,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    #if DEBUG
    let formatted = format(
      level: "ℹ️ INFO",
      message: message,
      file: file,
      function: function,
      line: line
    )
    logger.info("\(formatted, privacy: .public)")
    #endif
  }

  /// Logs a warning message.
  /// Emitted in all build configurations.
  ///
  /// - Parameters:
  ///   - message: The message to log.
  ///   - file: The file name where the log originates.
  ///   - function: The function name where the log originates.
  ///   - line: The line number where the log originates.
  public static func warning(
    _ message: String,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    let formatted = format(
      level: "⚠️ WARNING",
      message: message,
      file: file,
      function: function,
      line: line
    )
    logger.notice("\(formatted, privacy: .public)")
  }

  /// Logs an error message.
  /// Always emitted regardless of build configuration.
  ///
  /// - Parameters:
  ///   - message: The message to log.
  ///   - file: The file name where the log originates.
  ///   - function: The function name where the log originates.
  ///   - line: The line number where the log originates.
  public static func error(
    _ message: String,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    let formatted = format(
      level: "❌ ERROR",
      message: message,
      file: file,
      function: function,
      line: line
    )
    logger.error("\(formatted, privacy: .public)")
  }

  // MARK: - Formatting

  /// Builds the formatted log message.
  ///
  /// Final format:
  /// `[LEVEL] [FileName Function]:line - message`
  ///
  /// Example:
  /// `[🐛 DEBUG] [LoginViewModel refresh()]:42 - Starting request`
  private static func format(
    level: String,
    message: String,
    file: String,
    function: String,
    line: Int
  ) -> String {
    let fileName = (file as NSString).lastPathComponent
      .components(separatedBy: ".")
      .first ?? "UnknownFile"

    return "[\(level)] [\(fileName) \(function)]:\(line) - \(message)"
  }
}