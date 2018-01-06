//
//  QRCodeGenerator.swift
//  AddressGenerator
//
//  Created by Khoa Pham on 06.01.2018.
//  Copyright © 2018 Khoa Pham. All rights reserved.
//

import AppKit

final class QRCodeGenerator {
  func generate(string: String, size: CGSize) -> NSImage? {
    guard let data = string.data(using: .utf8) else {
      return nil
    }

    // Filter
    guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
      return nil
    }

    filter.setValue(data, forKey: "inputMessage")
    filter.setValue("Q", forKey: "inputCorrectionLevel")

    // CIImage
    guard let ciImage = filter.outputImage else {
      return nil
    }

    // NSImage
    let rep = NSCIImageRep(ciImage: ciImage)
    let image = NSImage(size: rep.size)
    image.addRepresentation(rep)

    // Scale
    let finalImage = NSImage(size: size)
    finalImage.lockFocus()
    NSGraphicsContext.current?.imageInterpolation = .none
    image.draw(in: NSRect(origin: .zero, size: size))
    finalImage.unlockFocus()

    return finalImage
  }
}
