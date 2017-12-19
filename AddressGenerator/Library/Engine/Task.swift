import AppKit

final class Task {

  static func run(command: String, input: Data? = nil) throws -> Data {
    let process = Process()
    process.launchPath = "/bin/bash"
    process.arguments = ["-c", command]

    // output
    let outputPipe = Pipe()
    var outputData = Data()
    process.standardOutput = outputPipe

    outputPipe.fileHandleForReading.readabilityHandler = { handler in
      let data = handler.availableData
      outputData.append(data)
    }

    // input
    if let data = input {
      let inputPipe = Pipe()
      let handle = inputPipe.fileHandleForWriting
      handle.write(data)
      handle.closeFile()

      process.standardInput = inputPipe
    }

    // launch
    process.launch()
    process.waitUntilExit()

    // clean
    outputPipe.fileHandleForReading.readabilityHandler = nil

    return outputData
  }
}

