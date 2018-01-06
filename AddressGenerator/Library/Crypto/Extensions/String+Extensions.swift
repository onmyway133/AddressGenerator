//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import Foundation

extension String {
  func toData() throws -> Data {
    guard let data = data(using: .utf8) else {
      throw InteralError.invalid
    }

    return data
  }
}
