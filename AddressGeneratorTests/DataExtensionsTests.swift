import XCTest
@testable import AddressGenerator

class DataExtensionsTests: XCTestCase {
  func testSha256() {
    do {
      let data = "hello".data(using: .utf8)!
      let hash = try! data.sha256()
      XCTAssertEqual(hash.count, 32)
      XCTAssertEqual(try! hash.hexDump().toString().count, 64)
    }

    do {
      let publicKey = "04d0988bfa799f7d7ef9ab3de97ef481cd0f75d2367ad456607647edde665d6f6fbdd594388756a7beaf73b4822bc22d36e9bda7db82df2b8b623673eefc0b7495"
      let data = publicKey.data(using: .utf8)!
      let hash = try data.sha256()
      XCTAssertEqual(hash.count, 32)
      XCTAssertEqual(
        try hash.hexDump().toString(),
        "52263faf869bbf7f0b52cbc54a835d3c8bbd6206ee4eec2e975c033c8016801f"
      )
    } catch {
      XCTFail()
    }
  }

  func testRmd160() {
    do {
      let data = "hello".data(using: .utf8)!
      let hash = try! data.rmd160()
      XCTAssertEqual(hash.count, 20)
      XCTAssertEqual(try! hash.hexDump().toString().count, 40)
    }

    do {
      let sha256 = "52263faf869bbf7f0b52cbc54a835d3c8bbd6206ee4eec2e975c033c8016801f"
      let data = sha256.data(using: .utf8)!
      let hash = try data.rmd160()
      XCTAssertEqual(hash.count, 20)
      XCTAssertEqual(
        try hash.hexDump().toString(),
        "224e60c530f4b6ba1c629858a8d819c86b77d2f9"
      )
    } catch {
      XCTFail()
    }
  }

  func testPrepend() {
    do {
      let rmd160 = "224e60c530f4b6ba1c629858a8d819c86b77d2f9"
      let data = try! Data.from(hexString: rmd160)
      let prepend = data.prepend(number: 0x00)
      XCTAssertEqual(prepend.count, 21)
      XCTAssertEqual(
        try prepend.hexDump().toString(),
        "00224e60c530f4b6ba1c629858a8d819c86b77d2f9"
      )
    }
  }

  func testTake() {
    do {
      let extendedRmd160 = "00224e60c530f4b6ba1c629858a8d819c86b77d2f9"
      let data = try Data.from(hexString: extendedRmd160)
      let hash = try data.sha256().sha256()
      let take = hash.take(byteCount: 4)

      XCTAssertEqual(take.count, 4)
      XCTAssertEqual(
        try take.hexDump().toString(),
        "579db493"
      )
    } catch {
      XCTFail()
    }
  }

  func testAppend() {
    do {
      let extendedRmd160 = "00224e60c530f4b6ba1c629858a8d819c86b77d2f9"
      let data = try! Data.from(hexString: extendedRmd160)
      let address = try! data.append(data: Data.from(hexString: "579db493"))

      XCTAssertEqual(address.count, 25)
      XCTAssertEqual(
        try address.hexDump().toString(),
        "00224e60c530f4b6ba1c629858a8d819c86b77d2f9579db493"
      )
    }
  }
}
