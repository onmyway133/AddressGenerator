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

    view.wantsLayer = true
    view.layer?.cornerRadius = 2
    view.layer?.backgroundColor = NSColor(e_hex: "#1E1E1E").cgColor

    activate(
      coinImageView.anchor.top.left.constant(4),
      coinImageView.anchor.bottom.constant(-4),
      coinImageView.anchor.width.ratio(1),

      label.anchor.centerY.equal.to(coinImageView.anchor.centerY),
      label.anchor.left.equal.to(coinImageView.anchor.right).constant(10)
    )
  }

  func update(selected: Bool) {
    if selected {
      view.layer?.borderWidth = 1
      view.layer?.borderColor = NSColor(e_hex: "FD4514").cgColor
    } else {
      view.layer?.borderWidth = 0
    }
  }
}
