//
//  QRCodeGenerator.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 06.01.2018.
//  Copyright © 2018 Khoa Pham. All rights reserved.
//

import AppKit

final class QRCodeGenerator {
  func generate(string: String) -> NSImage? {
    guard let data = string.data(using: .utf8) else {
      return nil
    }

    guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
      return nil
    }

    filter.setValue(data, forKey: "inputMessage")
    filter.setValue("Q", forKey: "inputCorrectionLevel")

    guard let ciImage = filter.outputImage else {
      return nil
    }

    let rep = NSCIImageRep(ciImage: ciImage)
    let image = NSImage(size: rep.size)
    image.addRepresentation(rep)

    return image
  }
}
