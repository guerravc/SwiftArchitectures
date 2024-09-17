//___FILEHEADER___

import Foundation

class PrintLog {
    class func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line ) {
        let className = (file.components(separatedBy: "/").last)?.components(separatedBy: ".").first
        debugPrint("[\(className!) \(function)] line: \(line) - \(message)")
    }
}
