import AppKit

/// Used for Bitcoin and similar coins
struct AltCoinGenerator: Generator {
  func generate() throws -> CryptoCurrencyAccount {
    let keyPair = try KeyPairGenerator.generate()

    // https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses

    let result = try keyPair.publicKey
      // 2 - Perform SHA-256 hashing on the public key
      .sha256()
      // 3 - Perform RIPEMD-160 hashing on the result of SHA-256
      .rmd160()

    let anotherResult = result
      // 4 - Add version byte in front of RIPEMD-160 hash (0x00 for Main Network)
      .prepend(number: 0x00)

    let abc = try anotherResult
      // 5 - Perform SHA-256 hash on the extended RIPEMD-160 result
      .sha256()
      // 6 - Perform SHA-256 hash on the result of the previous SHA-256 hash
      .sha256()

    print(result)

    return CryptoCurrencyAccount(privateKey: "", address: "")
  }
}
