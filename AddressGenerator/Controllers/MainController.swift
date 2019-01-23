//
//  ViewController.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 14.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import Cocoa
import Anchors

final class MainController: BaseController {
  private let coinsController = CoinsController()
  private let accountController = AccountController()

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()

    coinsController.select = { [weak self] coin in
      self?.handle(coin: coin)
    }
  }

  func setup() {
    addChild(coinsController)
    view.addSubview(coinsController.view)

    addChild(accountController)
    view.addSubview(accountController.view)

    activate(
      coinsController.view.anchor.left.constant(10),
      coinsController.view.anchor.top.constant(30),
      coinsController.view.anchor.bottom.constant(-20),

      coinsController.view.anchor.right.equal
        .to(accountController.view.anchor.left).constant(-20),
      coinsController.view.anchor.width.equal
        .to(accountController.view.anchor.width).multiplier(0.3),

      accountController.view.anchor.top.constant(10),
      accountController.view.anchor.right.bottom.constant(-20)
    )
  }

  func handle(coin: CoinAware) {
    accountController.coin = coin
  }
}

