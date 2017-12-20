import XCTest
@testable import AddressGenerator

class WalletImportGeneratorTests: XCTestCase {
  func testWalletImportFormatGenerator() {
    let privateKey = "896462332ff505dccfd04a61eea9ece054e0a0873d3bd9d92ddd8a0f27c0c275"
    let privateKeyData = try! Data.from(hexString: privateKey)
    let wif = try! WalletImportFormatGenerator().generate(privateKey: privateKeyData, prefix: 0x80)

    XCTAssertEqual(wif.count, 51)
    XCTAssertEqual(wif, "5Jro5XgQ7PCSr3rk8FRvYVqmGtRUr4xj2qSexxvNPVwahEe9R5m")
  }
}

