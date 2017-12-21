//
//  Label.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit

final class Label: NSTextField {
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)

    textColor = .red
    font = NSFont.systemFont(ofSize: 15)
    isEditable = false
    isBezeled = false
    drawsBackground = false
  }

  required init?(coder: NSCoder) {
    fatalError()
  }
}
