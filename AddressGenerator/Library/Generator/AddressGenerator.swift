import Foundation

struct CryptoCurrencyAccount {
  let keyPair: KeyPairGenerator.KeyPair
  let address: String
}

/// Generate cryptocurrency address
protocol AddressGenerator {
  func generate() throws -> String
}
