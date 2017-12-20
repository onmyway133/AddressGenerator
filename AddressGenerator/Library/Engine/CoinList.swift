import Foundation

struct CoinList {
  static let coins: [CoinAware] = [
    Bitcoin(name: "Bitcoin", publicKeyPrefix: 0x00, privateKeyPrefix: 0x80),
    Ethereum(name: "Ethereum")
  ]
}
