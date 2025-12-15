// ___FILEHEADER___

import Foundation

/// A lightweight logging utility for the application.
/// Provides log output categorized by severity levels.
/// In DEBUG builds, all log levels are printed.
/// In RELEASE builds, only warnings and errors are printed.
public enum Log {
  // MARK: - Public API
  
  /// Logs a debug-level message. Printed only in DEBUG builds.
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
    output(level: "🐛 DEBUG", message: message, file: file, function: function, line: line)
    #endif
  }
  
  /// Logs an informational message.
  /// Printed in DEBUG builds. Suppressed in RELEASE builds.
  public static func info(
    _ message: String,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    #if DEBUG
    output(level: "ℹ️ INFO", message: message, file: file, function: function, line: line)
    #endif
  }
  
  /// Logs a warning message.
  /// Printed in all build configurations.
  public static func warning(
    _ message: String,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    output(level: "⚠️ WARNING", message: message, file: file, function: function, line: line)
  }
  
  /// Logs an error message.
  /// Always printed regardless of build configuration.
  public static func error(
    _ message: String,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    output(level: "❌ ERROR", message: message, file: file, function: function, line: line)
  }
  
  // MARK: - Internal
  
  /// Prints a formatted log message.
  private static func output(
    level: String,
    message: String,
    file: String,
    function: String,
    line: Int
  ) {
    let fileName = (file as NSString).lastPathComponent
      .components(separatedBy: ".")
      .first ?? "UnknownFile"
    
    print("[\(level)] [\(fileName).\(function):\(line)] - \(message)")
  }
}