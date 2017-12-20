import Foundation

/// Generate public key - private key pair
final class KeyPairGenerator {

  /// Binary key only in DER format
  struct KeyPair {
    let publicKey: Data
    let privateKey: Data
  }

  func generate() throws -> KeyPair {
    // https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses

    // 0 - Having a private ECDSA key
    let pem = try Task.run(command: "openssl ecparam -name secp256k1 -genkey -noout")

    let privateKey = try Task.run(
      command: "openssl ec -outform DER | tail -c +8 | head -c 32",
      input: pem
    )

    // 1 - Take the corresponding public key generated with it
    let publicKey = try Task.run(
      command: "openssl ec -pubout -outform DER | tail -c 65",
      input: pem
    )

    return KeyPair(
      publicKey: publicKey,
      privateKey: privateKey
    )
  }
}
