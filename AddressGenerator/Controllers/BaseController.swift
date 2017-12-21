//
//  BaseController.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit

class BaseController: NSViewController {
  override func loadView() {
    self.view = NSView()
    self.view.wantsLayer = true
  }
}
