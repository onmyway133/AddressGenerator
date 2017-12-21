//
//  Cell.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit
import Anchors
import Omnia

final class Cell: NSCollectionViewItem {
  let label = Label()
  let coinImageView = NSImageView()

  override func loadView() {
    self.view = NSView()
    self.view.wantsLayer = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.e_addSubviews([
      coinImageView, label
    ])

    activate(
      coinImageView.anchor.top.left.constant(10),
      coinImageView.anchor.bottom.constant(-10),
      coinImageView.anchor.width.ratio(1),

      label.anchor.centerY.equal.to(coinImageView.anchor.centerY),
      label.anchor.left.equal.to(coinImageView.anchor.right).constant(10)
    )
  }
}
