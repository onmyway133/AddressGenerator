import AppKit

// https://en.bitcoin.it/wiki/Address
// https://en.bitcoin.it/wiki/Transaction#Pay-to-PubkeyHash
// Common P2PKH which begin with the number 1
// https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses
struct Pay2PubKeyHashGenerator {
  func generate(publicKey: Data, prefix: UInt8) throws -> String {
    let extendedRmd160Hash = try publicKey
      // 2 - Perform SHA-256 hashing on the public key
      .sha256()
      // 3 - Perform RIPEMD-160 hashing on the result of SHA-256
      .rmd160()
      // 4 - Add version byte in front of RIPEMD-160 hash (0x00 for Main Network)
      .prepend(number: prefix)

    let checksum = try extendedRmd160Hash
      // 5 - Perform SHA-256 hash on the extended RIPEMD-160 result
      .sha256()
      // 6 - Perform SHA-256 hash on the result of the previous SHA-256 hash
      .sha256()
      // 7 - Take the first 4 bytes of the second SHA-256 hash. This is the address checksum
      .takeFirst(byteCount: 4)

    // 8 - Add the 4 checksum bytes from stage 7 at the end of extended RIPEMD-160 hash from stage 4.
    // This is the 25-byte binary Bitcoin Address.
    let address = extendedRmd160Hash.append(data: checksum)

    return address.base58EncodedString()
  }
}
