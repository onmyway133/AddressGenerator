import XCTest
@testable import AddressGenerator

class KeccakHashTests: XCTestCase {

  func testHash() {
    do {
      let string = "hello"
      try XCTAssertEqual(
        KeccakHash().hash(data: string.toData()),
        Data.from(hexString: "1c8aff950685c2ed4bc3174f3472287b56d9517b9c948127319a09a7a36deac8")
      )
    }
  }
}


