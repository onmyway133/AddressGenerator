//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import XCTest
@testable import AddressGenerator

class AddressGeneratorTests: XCTestCase {
  func testPay2PubKeyHashGenerator() {
    let publicKey = "041a12f855d14451b786716164b8325da324aeed3f840fe77257feadfae2f1b0786105ddc906b6bcafb84a9a142bba69e77ad2f21c877c11f0b29676cbdf767af2"
    let publicKeyData = try! Data.from(hexString: publicKey)
    let address = try! Pay2PubKeyHashGenerator().generate(publicKey: publicKeyData, prefix: 0x00)

    XCTAssertEqual(address.count, 34)
    XCTAssertEqual(address, "1KRA1Q6tTxHA3otFGpwnrBVxf5TBe97zWp")
  }

  func testWalletImportFormatGenerator() {
    let privateKey = "896462332ff505dccfd04a61eea9ece054e0a0873d3bd9d92ddd8a0f27c0c275"
    let privateKeyData = try! Data.from(hexString: privateKey)
    let wif = try! WalletImportFormatGenerator().generate(privateKey: privateKeyData, prefix: 0x80)

    XCTAssertEqual(wif.count, 51)
    XCTAssertEqual(wif, "5Jro5XgQ7PCSr3rk8FRvYVqmGtRUr4xj2qSexxvNPVwahEe9R5m")
  }
}
