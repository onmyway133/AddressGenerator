import Foundation

protocol CoinAware {
  var name: String { get }
  func generate() throws -> Account
}
