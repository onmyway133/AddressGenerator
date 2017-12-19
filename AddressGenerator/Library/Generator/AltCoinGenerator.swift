import AppKit

/// Used for Bitcoin and similar coins
struct AltCoinGenerator: Generator {
  func generate() throws -> CryptoCurrencyAccount {
    let keyPair = try KeyPairGenerator().generate()

    // https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses

    let result = try keyPair.publicKey
      // 2 - Perform SHA-256 hashing on the public key
      .pipe(command: "openssl dgst -sha256 -binary")
      // 3 - Perform RIPEMD-160 hashing on the result of SHA-256
      .pipe(command: "openssl dgst -rmd160 -binary")
      // 4 - Add version byte in front of RIPEMD-160 hash (0x00 for Main Network)
      .prepend(number: 0x00)
      // 5 - Perform SHA-256 hash on the extended RIPEMD-160 result
      .pipe(command: "openssl dgst -sha256 -binary")
      // 6 - Perform SHA-256 hash on the result of the previous SHA-256 hash
      .pipe(command: "openssl dgst -sha256 -binary")

    print(result)

    return CryptoCurrencyAccount(privateKey: "", address: "")
  }
}
