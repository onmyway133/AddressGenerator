//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import Foundation

/// Ethereum and similar coins
class Ethereum {
  let name: String

  init(name: String) {
    self.name = name
  }
}

extension Ethereum: CoinAware {
  func generate() throws -> Account {
    let pair = try KeyPairGenerator().generate()
    let address = try EthereumGenerator().generate(publicKey: pair.publicKey)

    return try Account(
      rawPrivateKey: pair.privateKey.hexDump().toString(),
      rawPublicKey: pair.publicKey.hexDump().toString(),
      address: address,
      walletImportFormat: nil
    )
  }
}
