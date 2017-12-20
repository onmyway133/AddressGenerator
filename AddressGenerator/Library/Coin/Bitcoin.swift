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

  init(name: String, publicKeyPrefix: UInt8, privateKeyPrefix: UInt8) {
    self.name = name
    self.publicKeyPrefix = publicKeyPrefix
    self.privateKeyPrefix = privateKeyPrefix
  }
}
