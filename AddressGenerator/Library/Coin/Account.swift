//
//  Account.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 20.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import Foundation

struct Account {
  let rawPrivateKey: String
  let rawPublicKey: String
  let address: String
  let walletImportFormat: String?
}
