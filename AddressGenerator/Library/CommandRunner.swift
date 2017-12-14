import AppKit

enum CommandRunnerError: Error {
  case fail(Data)
}

final class CommandRunner {

  func run(command: String) throws -> String {
    let process = Process()
    process.launchPath = "/bin/bash"
    process.arguments = ["-c", command]

    // output
    let outputPipe = Pipe()
    var outputData = Data()

    outputPipe.fileHandleForReading.readabilityHandler = { handler in
      let data = handler.availableData
      outputData.append(data)
    }

    // error
    let errorPipe = Pipe()
    var errorData = Data()

    errorPipe.fileHandleForReading.readabilityHandler = { handler in
      let data = handler.availableData
      errorData.append(data)
    }

    // launch
    process.launch()
    process.waitUntilExit()

    // clean
    outputPipe.fileHandleForReading.readabilityHandler = nil
    errorPipe.fileHandleForReading.readabilityHandler = nil

    if process.terminationStatus != 0 {
      throw CommandRunnerError.fail(errorData)
    }

    return outputData.toString()
  }
}
