import Foundation

struct CryptoCurrencyAccount {
  let privateKey: String
  let address: String
}

/// Generate cryptocurrency account
protocol Generator {
  func generate() throws -> CryptoCurrencyAccount
}
