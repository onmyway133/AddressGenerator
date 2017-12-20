import Foundation

struct Account {
  let rawPrivateKey: String
  let rawPublicKey: String
  let address: String
  let walletImportFormat: String
}

protocol CoinAware {
  var name: String { get }
  func generate() throws -> Account
}
