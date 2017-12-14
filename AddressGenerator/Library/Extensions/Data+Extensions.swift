import Foundation

extension Data {
  func toString() -> String {
    guard let string = String(data: self, encoding: .utf8) else {
      return ""
    }

    if string.hasSuffix("\n") {
      let endIndex = string.index(before: string.endIndex)
      return String(string[..<endIndex])
    } else {
      return string
    }
  }
}
