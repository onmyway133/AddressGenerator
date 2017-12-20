//
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import XCTest
@testable import AddressGenerator

class CoinListTests: XCTestCase {
  /// Heavy test
  func _testWifStart() {
    let coins = CoinList.allCoins.flatMap({ $0 as? Bitcoin })
    for coin in coins {
      do {
        let account = try coin.generate()
        XCTAssertTrue(account.walletImportFormat!.starts(with: coin.wifStart), coin.name)
      } catch {
        XCTFail(coin.name)
      }
    }
  }
}


