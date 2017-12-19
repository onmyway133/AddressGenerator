import Foundation

struct CryptoCurrencyAccount {
  let keyPair: KeyPairGenerator.KeyPair
  let address: String
}

/// Generate cryptocurrency account
protocol Generator {
  func generate() throws -> CryptoCurrencyAccount
}
