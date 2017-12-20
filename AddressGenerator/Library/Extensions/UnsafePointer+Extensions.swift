import Foundation

extension UnsafeMutablePointer {
  func toData() -> Data {
    return Data(bytes: UnsafeRawPointer(self), count: 32)
  }
}
