//
//  Ripple.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 06.01.2018.
//  Copyright © 2018 Khoa Pham. All rights reserved.
//

import Foundation

// https://ripple.com/
struct Ripple: CoinAware {
  let name = "Ripple"
  func generate() throws -> Account {
    let pair = try KeyPairGenerator().generate()
    let address = try RippleGenerator().generate(publicKey: pair.publicKey)

    return try Account(
      rawPrivateKey: pair.privateKey.hexDump().toString(),
      rawPublicKey: pair.publicKey.hexDump().toString(),
      address: address,
      walletImportFormat: ""
    )
  }
}
