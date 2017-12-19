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

  func hexDump() throws -> Data {
    return try Task.run(command: "xxd -p -c \(count)", input: self)
  }

  func prepend(number: UInt8) -> Data {
    var number = number
    var data = Data(bytes: &number, count: MemoryLayout.size(ofValue: number))
    data.append(self)

    return data
  }
}

extension Data {
  func sha256() throws -> Data {
    return try Task.run(command: "openssl dgst -sha256 -binary", input: self)
  }

  func rmd160() throws -> Data {
    return try Task.run(command: "openssl dgst -rmd160 -binary", input: self)
  }
}
