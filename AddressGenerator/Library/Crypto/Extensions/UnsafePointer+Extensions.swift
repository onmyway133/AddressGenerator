//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import Foundation

extension UnsafeMutablePointer {
  func toData() -> Data {
    return Data(bytes: UnsafeRawPointer(self), count: 32)
  }
}
