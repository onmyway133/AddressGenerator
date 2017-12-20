//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import XCTest
@testable import AddressGenerator

class KeccakHashTests: XCTestCase {

  func testHash() {
    do {
      let string = "hello"
      let hash = try! KeccakHash().hash(data: string.toData())

      XCTAssertEqual(hash.count, 32)
      try XCTAssertEqual(
        hash,
        Data.from(hexString: "1c8aff950685c2ed4bc3174f3472287b56d9517b9c948127319a09a7a36deac8")
      )
    }
  }
}


