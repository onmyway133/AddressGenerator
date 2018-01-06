//
//  PublicKeyCompressorTests.swift
//  AddressGeneratorTests
//
//  Created by Khoa Pham on 06.01.2018.
//  Copyright © 2018 Khoa Pham. All rights reserved.
//

import XCTest
@testable import AddressGenerator

class PublicKeyCompressorTests: XCTestCase {
  func testCompressor() {
    let publicKey = "0482006e9398a6986eda61fe91674c3a108c399475bf1e738f19dfc2db11db1d28130c6b3b28aef9a9c7e7143dac6cf12c09b8444db61679abb1d86f85c038a58c"
    let publicKeyData = try! Data.from(hexString: publicKey)
    let compressed = PublicKeyCompressor().compress(publicKey: publicKeyData)
    let string = try! compressed.hexDump().toString()

    XCTAssertEqual(compressed.count, 33)
    XCTAssertEqual(string, "0282006e9398a6986eda61fe91674c3a108c399475bf1e738f19dfc2db11db1d28")
  }
}
