//
//  AccountController.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit
import Anchors

final class AccountController: BaseController {
  private let coinNameLabel = Label()
  private let button = NSButton()
  private let addressImageView = NSImageView()

  private let addressLabel = Label()
  private let addressValueLabel = Label()

  private let publicKeyLabel = Label()
  private let publicKeyValueLabel = Label()

  private let privateKeyLabel = Label()
  private let privateKeyValueLabel = Label()

  private let wifLabel = Label()
  private let wifValueLabel = Label()

  var coin: CoinAware? {
    didSet {
      coinNameLabel.stringValue = coin?.name ?? ""
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  private func setup() {
    view.e_addSubviews([
      coinNameLabel, button, addressImageView,
      addressLabel, addressValueLabel,
      publicKeyLabel, publicKeyValueLabel,
      privateKeyLabel, privateKeyValueLabel,
      wifLabel, wifValueLabel
    ])

    setupConstraints()
  }

  private func setupConstraints() {
    activate(
      coinNameLabel.anchor.top,
      coinNameLabel.anchor.centerX
    )
  }
}
