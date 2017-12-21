//
//  CoinsController.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit
import Anchors

final class CoinsController: NSViewController {
  var titleLabel: Label!
  var collectionView: NSCollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  func setup() {
    collectionView = NSCollectionView()
    view.addSubview(collectionView)

    titleLabel = Label()
    titleLabel.stringValue = "Choose currency"
    view.addSubview(titleLabel)
  }
}
