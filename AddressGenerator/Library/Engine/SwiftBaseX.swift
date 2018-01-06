//
//  BaseX.swift
//  SwiftBaseX
//
//  Created by Pelle Steffen Braendgaard on 7/22/17.
//  Copyright © 2017 Consensys AG. All rights reserved.
//

// https://raw.githubusercontent.com/uport-project/SwiftBaseX/develop/SwiftBaseX/BaseX.swift

import Foundation

enum Base58Alphabet: String {
  case normal = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

  // R_B58_DICT from https://ripple.com/build/accounts/
  case ripple = "rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz"
}

private func buildAlphabetBase(_ alphabet: String) -> (map: [Character:UInt], indexed: [Character], base: UInt, leader: Character) {
  let characters = alphabet
  let indexed:[Character] = characters.map {$0}
  var tmpMap = [Character: UInt]()
  var i:UInt = 0
  for c in characters {
    tmpMap[c] = i
    i += 1
  }

  let finalMap = tmpMap
  return (map: finalMap, indexed: indexed, base: UInt(characters.count), leader: characters.first!)
}

private func encodeData(alpha: (map:[Character:UInt], indexed:[Character], base: UInt, leader: Character), data: Data) -> String {
  if data.count == 0 {
    return ""
  }
  let bytes = [UInt8](data)

  var digits:[UInt] = [0]
  for byte in bytes {
    var carry = UInt(byte)
    for j in 0..<digits.count {
      carry += digits[j] << 8
      digits[j] = carry % alpha.base
      carry = (carry / alpha.base) | 0
    }
    while (carry > 0) {
      digits.append(carry % alpha.base)
      carry = (carry / alpha.base) | 0
    }
  }

  var output: String = ""
  // deal with leading zeros
  for k in 0..<data.count {
    if (bytes[k] == UInt8(0)) {
      output.append(alpha.leader)
    } else {
      break
    }
  }
  // convert digits to a string
  for d in digits.reversed() {
    output.append(alpha.indexed[Int(d)])
  }

  let final = output
  return final
}

extension Data {
  func base58EncodedString(alphabet: String = Base58Alphabet.normal.rawValue) -> String {
    return encodeData(
      alpha: buildAlphabetBase(alphabet),
      data: self
    )
  }
}
