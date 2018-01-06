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

    let payload = accountId
      // "r" in Ripple base58
      .prepend(number: 0x00)

    // Calculate the SHA-256 hash of the SHA-256 hash of the Account ID;
    // take the first 4 bytes. This value is the "checksum".
    let checksum = try payload
      .sha256()
      .sha256()
      .takeFirst(byteCount: 4)

    // Concatenate the payload and the checksum. Calculate the base58 value of the concatenated buffer. The result is the address.
    let address = payload.append(data: checksum)

    return address.base58EncodedString(alphabet: Base58Alphabet.ripple.rawValue)
  }
}
