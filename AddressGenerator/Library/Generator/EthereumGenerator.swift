import Foundation

/// Used for Ethereum and similar coins
struct EthereumGenerator: Generator {
  func generate() throws -> CryptoCurrencyAccount {
    return CryptoCurrencyAccount(privateKey: "", address: "")
  }
}
