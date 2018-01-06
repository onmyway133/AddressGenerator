//
//  RippleGenerator.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 06.01.2018.
//  Copyright © 2018 Khoa Pham. All rights reserved.
//

import Foundation

// https://ripple.com/build/accounts/
struct RippleGenerator {
  func generate(publicKey: Data) throws -> String {
    let accountId =
      // Start with a 33-byte ECDSA secp256k1 public key
      try PublicKeyCompressor().compress(publicKey: publicKey)
      // Calculate the RIPEMD160 hash of the SHA-256 hash of the public key.
      // This value is the "Account ID"
      .sha256()
      .rmd160()
      // "r" in Ripple base58
      .prepend(number: 0x00)

    // Calculate the SHA-256 hash of the SHA-256 hash of the Account ID;
    // take the first 4 bytes. This value is the "checksum".
    let checksum = try accountId
      // 5 - Perform SHA-256 hash on the extended RIPEMD-160 result
      .sha256()
      // 6 - Perform SHA-256 hash on the result of the previous SHA-256 hash
      .sha256()
      // 7 - Take the first 4 bytes of the second SHA-256 hash. This is the address checksum
      .takeFirst(byteCount: 4)

    // 8 - Add the 4 checksum bytes from stage 7 at the end of extended RIPEMD-160 hash from stage 4.
    // This is the 25-byte binary Bitcoin Address.
    let address = accountId.append(data: checksum)

    return address.base58EncodedString()
  }
}
