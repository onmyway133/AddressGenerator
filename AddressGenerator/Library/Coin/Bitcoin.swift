//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import Foundation

/// Bitcoin and similar coins
class Bitcoin {
  let name: String
  let publicKeyPrefix: UInt8
  let privateKeyPrefix: UInt8
  let wifStart: String
  let cwifStart: String

  init(name: String, publicKeyPrefix: UInt8, privateKeyPrefix: UInt8, wifStart: String, cwifStart: String) {
    self.name = name
    self.publicKeyPrefix = publicKeyPrefix
    self.privateKeyPrefix = privateKeyPrefix
    self.wifStart = wifStart
    self.cwifStart = cwifStart
  }
}

extension Bitcoin: CoinAware {
  func generate() throws -> Account {
    let pair = try KeyPairGenerator().generate()
    let address = try Pay2PubKeyHashGenerator().generate(publicKey: pair.publicKey, prefix: publicKeyPrefix)
    let wif = try WalletImportFormatGenerator().generate(privateKey: pair.privateKey, prefix: privateKeyPrefix)

    return try Account(
      rawPrivateKey: pair.privateKey.hexDump().toString(),
      rawPublicKey: pair.publicKey.hexDump().toString(),
      address: address,
      walletImportFormat: wif
    )
  }
}
