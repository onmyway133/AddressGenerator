import Foundation

/// Used for Ethereum and similar coins
struct EthereumGenerator {
  func generate(publicKey: Data) throws -> String {
    return try publicKey
      .dropFirstByte()
      .keccak256()
      .takeLast(byteCount: 20)
      .hexDump()
      .toString()
  }
}
