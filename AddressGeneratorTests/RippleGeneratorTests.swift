//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import XCTest
@testable import AddressGenerator

class RippleTests: XCTestCase {
  func testGenerator() {
    let publicKey = "0482006e9398a6986eda61fe91674c3a108c399475bf1e738f19dfc2db11db1d28130c6b3b28aef9a9c7e7143dac6cf12c09b8444db61679abb1d86f85c038a58c"
    let publicKeyData = try! Data.from(hexString: publicKey)
    let address = try! RippleGenerator().generate(publicKey: publicKeyData)

    XCTAssertEqual(address.count, 34)
    XCTAssertEqual(address, "3f5b765f6a9007a7a08b07c04acd391441045c1d")
  }
}


