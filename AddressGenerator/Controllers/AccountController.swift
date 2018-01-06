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

  private let aboutButton = NSButton()
  private let gitHubUrl = "https://github.com/onmyway133/AddressGenerator"

  var coin: CoinAware! {
    didSet {
      coinNameLabel.stringValue = coin.name
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
      wifLabel, wifValueLabel,
      aboutButton
    ])

    coinNameLabel.font = NSFont.systemFont(ofSize: 25, weight: .bold)
    [addressLabel, publicKeyLabel, privateKeyLabel, wifLabel].forEach {
      $0.font = NSFont.systemFont(ofSize: 15, weight: .semibold)
    }
    [addressValueLabel, publicKeyValueLabel, privateKeyValueLabel, wifValueLabel].forEach {
      $0.font = NSFont.systemFont(ofSize: 15)
      $0.textColor = NSColor(e_hex: "#e67e22")
      $0.isSelectable = true
    }

    addressLabel.stringValue = "Address"
    publicKeyLabel.stringValue = "Public Key"
    privateKeyLabel.stringValue = "Private Key"
    wifLabel.stringValue = "Private Key (Wallet Import Format)"

    button.title = "Generate"
    button.target = self
    button.action = #selector(generate)

    do {
      let attributeString = NSAttributedString(
        string: "GitHub: \(gitHubUrl)",
        attributes: [
          .foregroundColor: NSColor(e_hex: "#f1c40f")
        ]
      )

      aboutButton.attributedTitle = attributeString
      aboutButton.isBordered = false
      aboutButton.target = self
      aboutButton.action = #selector(about)
    }

    setupConstraints()
  }

  @objc private func generate() {
    do {
      let account = try coin.generate()
      addressValueLabel.stringValue = account.address
      publicKeyValueLabel.stringValue = account.rawPublicKey
      privateKeyValueLabel.stringValue = account.rawPrivateKey
      wifValueLabel.stringValue = account.walletImportFormat ?? ""

      addressImageView.image = QRCodeGenerator().generate(
        string: account.address,
        size: addressImageView.frame.size
      )
    } catch {

    }
  }

  @objc private func about() {
    NSWorkspace.shared.open(URL(string: gitHubUrl)!)
  }

  private func setupConstraints() {
    activate(
      coinNameLabel.anchor.top.constant(20),
      coinNameLabel.anchor.centerX,

      button.anchor.top.equal.to(coinNameLabel.anchor.bottom).constant(10),
      button.anchor.centerX,
      button.anchor.width.equal.to(100),
      button.anchor.height.equal.to(30),

      addressImageView.anchor.top.equal.to(button.anchor.bottom).constant(30),
      addressImageView.anchor.centerX,
      addressImageView.anchor.width.equal.to(200),
      addressImageView.anchor.height.ratio(1),

      addressLabel.anchor.top.equal
        .to(addressImageView.anchor.bottom).constant(20),
      addressLabel.anchor.centerX,

      addressValueLabel.anchor.top.equal
        .to(addressLabel.anchor.bottom).constant(5),
      addressValueLabel.anchor.centerX,

      publicKeyLabel.anchor.top.equal
        .to(addressValueLabel.anchor.bottom).constant(20),
      publicKeyLabel.anchor.left.constant(10),

      publicKeyValueLabel.anchor.top.equal
        .to(publicKeyLabel.anchor.bottom).constant(5),
      publicKeyValueLabel.anchor.left.constant(10),

      privateKeyLabel.anchor.top.equal
        .to(publicKeyValueLabel.anchor.bottom).constant(10),
      privateKeyLabel.anchor.left.constant(10),

      privateKeyValueLabel.anchor.top.equal
        .to(privateKeyLabel.anchor.bottom).constant(5),
      privateKeyValueLabel.anchor.left.constant(10),

      wifLabel.anchor.top.equal
        .to(privateKeyValueLabel.anchor.bottom).constant(10),
      wifLabel.anchor.left.constant(10),

      wifValueLabel.anchor.top.equal
        .to(wifLabel.anchor.bottom).constant(5),
      wifValueLabel.anchor.left.constant(10)
    )

    activate(
      aboutButton.anchor.top.right
    )
  }
}
