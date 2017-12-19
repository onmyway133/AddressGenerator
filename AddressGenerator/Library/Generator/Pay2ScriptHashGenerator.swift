import AppKit

// https://en.bitcoin.it/wiki/Address
// https://en.bitcoin.it/wiki/Pay_to_script_hash
// Newer P2SH type starting with the number 3
struct Pay2ScriptHashGenerator: AddressGenerator {
  init() {}

  func generate() throws -> String {
    fatalError()
  }
}
