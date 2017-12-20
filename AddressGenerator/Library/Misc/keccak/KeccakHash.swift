import Foundation

/// // https://github.com/ethereum/ethash/blob/master/src/libethash/sha3.hs
class KeccakHash {
  func hash(data: Data) throws -> Data {
    guard let dataPointer = data.toPointer() else {
      throw InteralError.invalid
    }

    let byteCount = 32

    let result = UnsafeMutablePointer<UInt8>.allocate(capacity: byteCount)
    sha3_256(result, byteCount, dataPointer, data.count)
    return result.toData()
  }
}
