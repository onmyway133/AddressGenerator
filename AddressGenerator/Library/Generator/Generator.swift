import Foundation

struct Pair {
  let privateKey: String
  let address: String
}

protocol Generator {
  func generate() -> Pair
}
