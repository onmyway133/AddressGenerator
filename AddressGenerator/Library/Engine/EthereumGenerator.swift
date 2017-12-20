//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import Foundation

/// Used for Ethereum and similar coins
struct EthereumGenerator {
  func generate(publicKey: Data) throws -> String {
    return try publicKey
      .dropFirstByte()
      .keccak256()
      .takeLast(byteCount: 20)
      .hexDump()
      .toString()
  }
}
