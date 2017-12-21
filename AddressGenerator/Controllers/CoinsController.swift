//
//  CoinsController.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit
import Anchors

final class CoinsController: BaseController, NSCollectionViewDataSource, NSCollectionViewDelegate {
  var titleLabel: Label!
  var collectionView: NSCollectionView!
  let coins = CoinList.allCoins

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  func setup() {
    titleLabel = Label()
    titleLabel.stringValue = "Choose currency"
    view.addSubview(titleLabel)
    activate(
      titleLabel.anchor.top.left
    )

    collectionView = NSCollectionView()
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.collectionViewLayout = NSCollectionViewFlowLayout()
    view.addSubview(collectionView)
    activate(
      collectionView.anchor.top.equal.to(titleLabel.anchor.bottom).constant(10),
      collectionView.anchor.left.bottom.right
    )
  }

  // MARK: - NSCollectionViewDataSource

  func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    return coins.count
  }

  func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    return Cell()
  }

  // MARK: - NSCollectionViewDelegate
}
