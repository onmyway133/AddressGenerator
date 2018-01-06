//
//  PublicKeyCompressor.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 06.01.2018.
//  Copyright © 2018 Khoa Pham. All rights reserved.
//

import Foundation

// http://davidederosa.com/basic-blockchain-programming/elliptic-curve-keys/
struct PublicKeyCompressor {
  func compress(publicKey: Data) -> Data {
    let x = publicKey.takeFirst(byteCount: 1 + 32)
    let postfix = publicKey[64]
    let prefix: UInt8 = (postfix % 2 == 0) ? 0x02 : 0x03
    return x.prepend(number: prefix)
  }
}
