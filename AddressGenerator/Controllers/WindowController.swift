//
//  WindowController.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit

final class WindowController: NSWindowController {
  override func windowDidLoad() {
    super.windowDidLoad()

    window?.setContentSize(NSSize(width: 900, height: 600))
    window?.backgroundColor = NSColor(e_hex: "#333333")
  }
}
