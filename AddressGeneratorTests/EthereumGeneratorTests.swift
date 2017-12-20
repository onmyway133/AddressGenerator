import XCTest
@testable import AddressGenerator

class EthereumTests: XCTestCase {
  func testPay2PubKeyHashGenerator() {
    let publicKey = "041a12f855d14451b786716164b8325da324aeed3f840fe77257feadfae2f1b0786105ddc906b6bcafb84a9a142bba69e77ad2f21c877c11f0b29676cbdf767af2"
    let publicKeyData = try! Data.from(hexString: publicKey)
    let address = try! EthereumGenerator().generate(publicKey: publicKeyData)

    XCTAssertEqual(address.count, 40)
    XCTAssertEqual(address, "3f5b765f6a9007a7a08b07c04acd391441045c1d")
  }
}

