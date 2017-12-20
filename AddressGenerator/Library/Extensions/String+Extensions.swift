import Foundation

extension String {
  func toData() throws -> Data {
    guard let data = data(using: .utf8) else {
      throw InteralError.invalid
    }

    return data
  }
}
