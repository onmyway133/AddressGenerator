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


  func pipe(command: String) throws -> Data {
    return try Task.run(command: command, input: self)
  }

  func hexDump(columnCount: Int) throws -> Data {
    return try Task.run(command: "xxd -p -c \(columnCount)", input: self)
  }

  func prepend(number: Int) -> Data {
    return self
  }
}
