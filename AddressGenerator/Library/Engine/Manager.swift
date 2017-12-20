import Foundation

class Manager {
  let coins: [CoinAware]

  init() {
    coins = CoinList.coins.sorted(by: { coin1, coin2 in
      return coin1.name < coin2.name
    })
  }
}
