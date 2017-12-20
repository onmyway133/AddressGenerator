import XCTest
@testable import AddressGenerator

class KeyPairGeneratorTests: XCTestCase {

  func testKeyPairGenerator() {
    let pair = try! KeyPairGenerator().generate()

    XCTAssertEqual(pair.privateKey.count, 32)
    XCTAssertEqual(pair.publicKey.count, 65)
  }

  func testHexDump() {
    let pair = try! KeyPairGenerator().generate()

    XCTAssertEqual(try! pair.privateKey.hexDump().count, 65)
    XCTAssertEqual(try! pair.publicKey.hexDump().count, 131)

    XCTAssertEqual(try! pair.privateKey.hexDump().toString().count, 64)
    XCTAssertEqual(try! pair.publicKey.hexDump().toString().count, 130)
  }
}

